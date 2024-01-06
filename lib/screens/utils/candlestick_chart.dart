import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:web_socket_channel/io.dart';

import '../../model/chart_data.dart';

class CandlestickChart extends StatefulWidget {
  @override
  _CandlestickChartState createState() => _CandlestickChartState();
}

class _CandlestickChartState extends State<CandlestickChart> {
  late List<ChartData> chartData;

  @override
  void initState() {
    super.initState();
    chartData = [];
    dataStream();
  }

  dataStream() {
    final channel = IOWebSocketChannel.connect(
      "wss://stream.binance.com:9443/ws/btcusdt@kline_1s",
    );
    channel.stream.listen((message) {
      var getData = jsonDecode(message);
      setState(() {
        var kline = getData['k'];
        double open = double.parse(kline['o']);
        double close = double.parse(kline['c']);
        double high = double.parse(kline['h']);
        double low = double.parse(kline['l']);
        ChartData newChartData = ChartData(
          time: DateTime.fromMillisecondsSinceEpoch(kline['t']),
          open: open,
          close: close,
          high: high,
          low: low,
        );
        chartData.add(newChartData);

        if (chartData.length > 20) {
          chartData.removeAt(0);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      zoomPanBehavior: ZoomPanBehavior(
        enablePinching: true,
        enableDoubleTapZooming: true,
        enableSelectionZooming: true,
        enablePanning: true,
        zoomMode: ZoomMode.x,
      ),
      primaryXAxis: DateTimeAxis(
        intervalType: DateTimeIntervalType.days,
        minorGridLines: const MinorGridLines(width: 0),
        majorGridLines: MajorGridLines(width: 0),
        edgeLabelPlacement: EdgeLabelPlacement.shift,
      ),
      primaryYAxis: NumericAxis(
        opposedPosition: true,
        majorGridLines: const MajorGridLines(width: 0),
        enableAutoIntervalOnZooming: true,
      ),
      series: <CartesianSeries>[
        CandleSeries<ChartData, DateTime>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.time,
          lowValueMapper: (ChartData data, _) => data.low,
          highValueMapper: (ChartData data, _) => data.high,
          openValueMapper: (ChartData data, _) => data.open,
          closeValueMapper: (ChartData data, _) => data.close,
        ),
      ],
    );
  }
}