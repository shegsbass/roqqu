import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../network/web_socket_manager.dart';

class CoinDataSection extends StatefulWidget {
  const CoinDataSection({super.key});

  @override
  State<CoinDataSection> createState() => _CoinDataSectionState();
}

class _CoinDataSectionState extends State<CoinDataSection> {

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