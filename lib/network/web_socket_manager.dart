import 'dart:convert';

import 'package:web_socket_channel/io.dart';

import '../model/chart_data.dart';

class WebSocketManager {
  late double currentPrice;
  late List<ChartData> chartData;
  late IOWebSocketChannel channel;
  late Function onPriceUpdate; // Callback function

  WebSocketManager(String symbol, this.onPriceUpdate) {
    currentPrice = 0.0;
    chartData = [];
    channel = IOWebSocketChannel.connect(
      "wss://stream.binance.com:9443/ws/$symbol@kline_1s",
    );

    channel.stream.listen((message) {
      var getData = jsonDecode(message);
      updateChartData(getData);
    });
  }

  void updateChartData(dynamic getData) {
    var kline = getData['k'];
    double close = double.parse(kline['c']);
    currentPrice = close;

    // Trigger UI update
    onPriceUpdate();

    ChartData newChartData = ChartData(
      time: DateTime.fromMillisecondsSinceEpoch(kline['t']),
      open: double.parse(kline['o']),
      close: close,
      high: double.parse(kline['h']),
      low: double.parse(kline['l']),
    );
    chartData.add(newChartData);

    if (chartData.length > 20) {
      chartData.removeAt(0);
    }
  }

  void dispose() {
    channel.sink.close();
  }
}
