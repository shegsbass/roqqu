import 'dart:async';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

import '../orderbook_web_socket.dart';
import '../web_socket_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF8F8F9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(),
              SizedBox(height: 8),
              TopInfoSection(),
              SizedBox(height: 8),
              CandleSection(),
              SizedBox(height: 8),
              OrderSection(),
              SizedBox(height: 62),
              ActionButtonSection(),
              SizedBox(height: 83),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: double.infinity,
      color: Colors.white,

      padding: EdgeInsets.symmetric(horizontal: 16),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Logo
          Image.asset('assets/images/company_logo.png'),

          // Spacer between Logo and Avatar
          SizedBox(width: 110),

          // Circular Profile Image
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar_image.png'),
            radius: 16,
          ),

          SizedBox(width: 16),

          // Globe Icon
          Image.asset('assets/images/globe.png'),

          SizedBox(width: 16),

          // Menu Drawer Icon
          Image.asset('assets/images/menu.png'),
        ],
      ),
    );
  }
}

class TopInfoSection extends StatefulWidget {
  const TopInfoSection({super.key});

  @override
  State<TopInfoSection> createState() => _TopInfoSectionState();
}

class _TopInfoSectionState extends State<TopInfoSection> {

  late WebSocketManager webSocketManager;

  @override
  void initState() {
    super.initState();
    webSocketManager = WebSocketManager('btcusdt', _updateUI);
    webSocketManager.currentPrice;
  }

  void _updateUI() {
    setState(() {
      // Update any UI components related to the price
    });
  }

  @override
  void dispose() {
    webSocketManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 126,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFF1F1F1)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      'assets/images/bitcoin_logo.png',
                      width: 24,
                      height: 24,
                    ),
                    Positioned(
                      top: 0,
                      left: 20,
                      child: Image.asset(
                        'assets/images/dollar_logo.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
                ),

                // Text
                SizedBox(width: 25),
                Text(
                  'BTC/USDT',
                  style: TextStyle(
                    color: Color(0xFF1C2127),
                    fontSize: 18,
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w500,
                  ),
                ),

                // Icon
                SizedBox(width: 16),
                Icon(Icons.keyboard_arrow_down_outlined),

                // Text
                SizedBox(width: 27),

                Text(
                  '\$${webSocketManager.currentPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Color(0xFF00C076),
                    fontSize: 18,
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            // Spacer
            SizedBox(height: 14),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 48,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 16,
                                  color: Color(0XFF737A91),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '24h change',
                                  style: TextStyle(
                                    color: Color(0xFF737A91),
                                    fontSize: 12,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Text(
                              '520.80 +1.25%',
                              style: TextStyle(
                                color: Color(0xFF00C076),
                                fontSize: 14,
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w500,
                                height: 0.12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 16),
                        Opacity(
                          opacity: 0.10,
                          child: Container(
                            width: 1,
                            height: 48,
                            decoration: ShapeDecoration(
                              color: Color(0xFF737A91),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1)),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.arrow_upward,
                                  size: 16,
                                  color: Color(0XFF737A91),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '24h high',
                                  style: TextStyle(
                                    color: Color(0xFF737A91),
                                    fontSize: 12,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Text(
                              '520.80 +1.25%',
                              style: TextStyle(
                                color: Color(0xFF1C2127),
                                fontSize: 14,
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w500,
                                height: 0.12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 16),
                        Opacity(
                          opacity: 0.10,
                          child: Container(
                            width: 1,
                            height: 48,
                            decoration: ShapeDecoration(
                              color: Color(0xFF737A91),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1)),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.arrow_downward,
                                  size: 16,
                                  color: Color(0XFF737A91),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '24h low',
                                  style: TextStyle(
                                    color: Color(0xFF737A91),
                                    fontSize: 12,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Text(
                              '520.80 +1.25%',
                              style: TextStyle(
                                color: Color(0xFF1C2127),
                                fontSize: 14,
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w500,
                                height: 0.12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 16),
                        Opacity(
                          opacity: 0.10,
                          child: Container(
                            width: 1,
                            height: 48,
                            decoration: ShapeDecoration(
                              color: Color(0xFF737A91),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1)),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 16,
                                  color: Color(0XFF737A91),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '24h change',
                                  style: TextStyle(
                                    color: Color(0xFF737A91),
                                    fontSize: 12,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Text(
                              '520.80 +1.25%',
                              style: TextStyle(
                                color: Color(0xFF1C2127),
                                fontSize: 14,
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w500,
                                height: 0.12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CandleSection extends StatefulWidget {
  const CandleSection({super.key});

  @override
  State<CandleSection> createState() => _CandleSectionState();
}

class _CandleSectionState extends State<CandleSection> {

  late OrderbookWebSocketManager orderbookWebSocketManager;
  String orderBookText = '';

  @override
  void initState() {
    super.initState();
    orderbookWebSocketManager = OrderbookWebSocketManager('btcusdt');
    orderbookWebSocketManager.getOrderbookDataStream().listen(_updateOrderbookUI);
  }

  @override
  void dispose() {
    orderbookWebSocketManager.dispose();
    super.dispose();
  }

  void _updateOrderbookUI(Map<String, dynamic> orderbookData) {
    setState(() {
      List<dynamic>? bids = orderbookData['b'];
      List<dynamic>? asks = orderbookData['a'];

      if (bids != null && asks != null && bids.isNotEmpty && asks.isNotEmpty) {
        double bidPrice = double.parse((bids[0] as List<dynamic>).first);
        double bidAmount = double.parse((bids[0] as List<dynamic>).last);
        double bidTotal = bidPrice * bidAmount;

        double askPrice = double.parse((asks[0] as List<dynamic>).first);
        double askAmount = double.parse((asks[0] as List<dynamic>).last);
        double askTotal = askPrice * askAmount;

        orderBookText = '''
        Bid: Price - $bidPrice, Amount - $bidAmount, Total - $bidTotal
        Ask: Price - $askPrice, Amount - $askAmount, Total - $askTotal
      ''';
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        height: 591,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFF1F1F1)),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 40,
                width: 358,
                decoration: ShapeDecoration(
                  color: Color(0xFFF1F1F1),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFF1F1F1)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Colors.white,
                      shadows: [
                        BoxShadow(
                          color: Color(0x0A000000),
                          blurRadius: 1,
                          offset: Offset(0, 3),
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: Color(0x1E000000),
                          blurRadius: 8,
                          offset: Offset(0, 3),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    labelColor: Color(0xFF1C2127),
                    unselectedLabelColor: Color(0xFF737A91),
                    tabs: [
                      Tab(
                        child: Text(
                          'Charts',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Orderbook',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Recent trades',
                          textAlign: TextAlign.center,
                          softWrap: false,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Content of Tab 1
                  Container(
                    child: CandlestickChart(),
                  ),

                  // Content of Tab 2
                  Container(
                    child: Column(
                      children: [
                        Text('Real-time Order Book Data:'),
                        Text(orderBookText),
                      ],
                    ),
                  ),

                  // Content of Tab 3
                  Container(
                    child: Center(child: Text('This is the recent trade tab')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class OrderBookTable extends StatelessWidget {
  final List<List<String>> bids;
  final List<List<String>> asks;

  OrderBookTable({required this.bids, required this.asks});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
      },
      children: [
        TableRow(
          children: [
            TableCell(
              child: Center(child: Text('Price')),
            ),
            TableCell(
              child: Center(child: Text('Amount')),
            ),
            TableCell(
              child: Center(child: Text('Total')),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Center(child: Text('Bids')),
            ),
            TableCell(
              child: Center(child: Text('Asks')),
            ),
            TableCell(
              child: Container(), // Placeholder for Total column
            ),
          ],
        ),
        _buildOrderBookRow(bids),
        _buildOrderBookRow(asks),
      ],
    );
  }

  TableRow _buildOrderBookRow(List<List<String>> orders) {
    return TableRow(
      children: [
        TableCell(
          child: Column(
            children: orders.map((order) => Center(child: Text(order[0]))).toList(),
          ),
        ),
        TableCell(
          child: Column(
            children: orders.map((order) => Center(child: Text(order[1]))).toList(),
          ),
        ),
        TableCell(
          child: Container(), // Placeholder for Total column
        ),
      ],
    );
  }
}



void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: CandleSection(),
      ),
    ),
  );
}


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

class ChartData {
  final DateTime time;
  final double open;
  final double high;
  final double low;
  final double close;

  ChartData({
    required this.time,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });
}

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       body: CandleSection(),
//     ),
//   ));
// }




class OrderSection extends StatelessWidget {
  const OrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        height: 350,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFF1F1F1)),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: Color(0xFFF1F1F1),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFF1F1F1)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: TabBar(
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Colors.white,
                      shadows: [
                        BoxShadow(
                          color: Color(0x0A000000),
                          blurRadius: 1,
                          offset: Offset(0, 3),
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: Color(0x1E000000),
                          blurRadius: 8,
                          offset: Offset(0, 3),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    labelColor: Color(0xFF1C2127),
                    unselectedLabelColor: Color(0xFF737A91),
                    tabs: [
                      Tab(
                        child: Text(
                          'Open Orders',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'satoshi',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Positions',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Order History',
                          textAlign: TextAlign.center,
                          softWrap: false,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Trade History',
                          textAlign: TextAlign.center,
                          softWrap: false,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Content of Tab 1
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'No Open Orders',
                              style: TextStyle(
                                color: Color(0xFF1C2127),
                                fontSize: 18,
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Center(
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id pulvinar nullam sit imperdiet pulvinar.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF737A91),
                                fontSize: 14,
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Content of Tab 2
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'No Positions',
                              style: TextStyle(
                                color: Color(0xFF1C2127),
                                fontSize: 18,
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Center(
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id pulvinar nullam sit imperdiet pulvinar.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF737A91),
                                fontSize: 14,
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Content of Tab 3
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'No Order History',
                              style: TextStyle(
                                color: Color(0xFF1C2127),
                                fontSize: 18,
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Center(
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id pulvinar nullam sit imperdiet pulvinar.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF737A91),
                                fontSize: 14,
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Content of Tab 4
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'No Trade History',
                              style: TextStyle(
                                color: Color(0xFF1C2127),
                                fontSize: 18,
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Center(
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id pulvinar nullam sit imperdiet pulvinar.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF737A91),
                                fontSize: 14,
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButtonSection extends StatelessWidget {
  const ActionButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(12),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFF1F1F1)),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: (){
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    // Use the BottomSheetContent widget as the content of the bottom sheet
                    return BottomSheetContent();
                  },
                );
              },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              fixedSize: Size(171, 32),
              backgroundColor: Color(0xFF25C26E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
              child: Text(
                'Buy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w700,
                  height: 0.12,
                ),
              ),
          ),


          SizedBox(width: 16),

          ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              fixedSize: Size(171, 32),
              backgroundColor: Color(0xFFFF5449),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              'Sell',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w700,
                height: 0.12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Container(
        height: 604,
        width: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, top: 28),
              child: Container(
                height: 32,
                width: 326,
                decoration: ShapeDecoration(
                  color: Color(0xFFF1F1F1),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFF1F1F1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: _CustomIndicator(
                      color: Color(0xFF00C076), // Green color for the stroke
                      indicatorHeight: 28, // Height of the indicator
                      cornerRadius: 8, // Width of the indicator
                    ),
                    labelColor: Color(0xFF1C2127),
                    unselectedLabelColor: Color(0xFF737A91),
                    tabs: [
                      Tab(
                        child: Text(
                          'Buy',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Sell',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Content of Tab 1
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 41),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 28,
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 55,
                                height: 28,
                                alignment: Alignment.center,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFCFD3D8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),

                                child: Text(
                                  'Limit',
                                  style: TextStyle(
                                    color: Color(0xFF1C2127),
                                    fontSize: 14,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),

                              SizedBox(width: 25),

                              Container(
                                width: 68,
                                height: 28,
                                alignment: Alignment.center,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),

                                child: Text(
                                  'Market',
                                  style: TextStyle(
                                    color: Color(0xFF737A91),
                                    fontSize: 14,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),

                              SizedBox(width: 25),

                              Container(
                                width: 90,
                                height: 28,
                                alignment: Alignment.center,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),

                                child: Text(
                                  'Stop-Limit',
                                  softWrap: false,
                                  style: TextStyle(
                                    color: Color(0xFF737A91),
                                    fontSize: 14,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),


                      SizedBox(height: 16),


                      Container(
                        width: 322,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: Color(0xFFF1F1F1)),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            label: Row(
                              children: [
                                Text(
                                  'Limit price',
                                  style: TextStyle(
                                    color: Color(0xFF737A91),
                                    fontSize: 12,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                SizedBox(width: 4),

                                Icon(
                                    Icons.info_outlined,
                                  size: 12,
                                  color: Color(0XFF737A91),
                                ),

                                SizedBox(width: 100),

                                Text(
                                  '0.00',
                                  style: TextStyle(
                                    color: Color(0xFF737A91),
                                    fontSize: 12,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                SizedBox(width: 4),

                                Text(
                                  'USD',
                                  style: TextStyle(
                                    color: Color(0xFF737A91),
                                    fontSize: 12,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                          SizedBox(height: 16),

                          Container(
                            width: 322,
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2, color: Color(0xFFF1F1F1)), // Set your desired color here
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                label: Row(
                                  children: [
                                    Text(
                                      'Amount',
                                      style: TextStyle(
                                        color: Color(0xFF737A91),
                                        fontSize: 12,
                                        fontFamily: 'Satoshi',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),

                                    SizedBox(width: 4),

                                    Icon(
                                      Icons.info_outlined,
                                      size: 12,
                                      color: Color(0XFF737A91),
                                    ),

                                    SizedBox(width: 115),

                                    Text(
                                      '0.00',
                                      style: TextStyle(
                                        color: Color(0xFF737A91),
                                        fontSize: 12,
                                        fontFamily: 'Satoshi',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),

                                    SizedBox(width: 4),

                                    Text(
                                      'USD',
                                      style: TextStyle(
                                        color: Color(0xFF737A91),
                                        fontSize: 12,
                                        fontFamily: 'Satoshi',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),


                          SizedBox(height: 16),

                          Container(
                            width: 322,
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2, color: Color(0xFFF1F1F1)), // Set your desired color here
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                label: Row(
                                  children: [
                                    Text(
                                      'Type',
                                      style: TextStyle(
                                        color: Color(0xFF737A91),
                                        fontSize: 12,
                                        fontFamily: 'Satoshi',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),

                                    SizedBox(width: 4),

                                    Icon(
                                      Icons.info_outlined,
                                      size: 12,
                                      color: Color(0XFF737A91),
                                    ),

                                    SizedBox(width: 70),

                                    Text(
                                      'Good till cancelled',
                                      style: TextStyle(
                                        color: Color(0xFF737A91),
                                        fontSize: 12,
                                        fontFamily: 'Satoshi',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),

                                    SizedBox(width: 4),

                                    Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                      size: 12,
                                      color: Color(0XFF737A91),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 16),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 16.0,
                                height: 16.0,
                                child: Checkbox(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  side: BorderSide(
                                    width: 1,
                                    color: Color(0xFF373B3F),
                                  ),
                                  value: false, // Set the initial value based on your requirement
                                  onChanged: (bool? value) {
                                    // Handle checkbox state change
                                  },
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                              ),

                              SizedBox(width: 8.0),

                              Text(
                                'Post Only',
                                style: TextStyle(
                                  color: Color(0xFF737A91),
                                  fontSize: 12,
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w500,
                                  height: 0.11,
                                ),
                              ),

                              SizedBox(width: 5.0),

                              Icon(
                                Icons.info_outlined,
                                size: 12,
                                color: Color(0XFF737A91),
                              ),
                            ],
                          ),


                          SizedBox(height: 16.0),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                  color: Color(0xFF737A91),
                                  fontSize: 12,
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w500,
                                  height: 0.11,
                                ),
                              ),


                              Text(
                                '0.00',
                                style: TextStyle(
                                  color: Color(0xFF737A91),
                                  fontSize: 12,
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w500,
                                  height: 0.11,
                                ),
                              )

                            ],
                          ),

                        ],
                      ),
                    ),
                  ),



                  // Content of Tab 2
                  Container(
                    child: Center(child: Text('This is the Sell tab')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _CustomIndicator extends Decoration {
  final Color color;
  final double indicatorHeight;
  final double cornerRadius;

  _CustomIndicator({
    required this.color,
    required this.indicatorHeight,
    this.cornerRadius = 8,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomIndicatorPainter(
      color: color,
      indicatorHeight: indicatorHeight,
      cornerRadius: cornerRadius,
    );
  }
}

class _CustomIndicatorPainter extends BoxPainter {
  final Paint _fillPaint;
  final Paint _strokePaint;
  final double indicatorHeight;
  final double cornerRadius;

  _CustomIndicatorPainter({
    required Color color,
    required this.indicatorHeight,
    required this.cornerRadius,
  })  : _fillPaint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill,
        _strokePaint = Paint()
          ..color = color
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;
    final double indicatorTop = rect.bottom - indicatorHeight;
    final Rect indicatorRect = Rect.fromPoints(
      Offset(rect.left, indicatorTop),
      Offset(rect.right, rect.bottom),
    );
    final RRect roundedRect = RRect.fromRectAndRadius(indicatorRect, Radius.circular(cornerRadius));

    // Draw the filled indicator
    canvas.drawRRect(roundedRect, _fillPaint);

    // Draw the stroke around the indicator
    canvas.drawRRect(roundedRect, _strokePaint);
  }
}

