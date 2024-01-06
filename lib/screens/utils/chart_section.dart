import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../network/orderbook_web_socket.dart';
import 'candlestick_chart.dart';

class ChartSection extends StatefulWidget {
  const ChartSection({Key? key});

  @override
  State<ChartSection> createState() => _ChartSectionState();
}

class _ChartSectionState extends State<ChartSection> {
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

      if (bids != null &&
          asks != null &&
          bids.isNotEmpty &&
          asks.isNotEmpty) {
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
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Color(0xFFF1F1F1)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 40,
                width: 358,
                decoration: BoxDecoration(
                  color: Color(0xFFF1F1F1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
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
