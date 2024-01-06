import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roqqu/screens/utils/custom_tab_indicator.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2, // Number of tabs
      child: SingleChildScrollView(
        child: Container(
          height:604,
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
                padding: const EdgeInsets.only(left: 34, right: 34, top: 10),
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
                      indicator: CustomIndicator(
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
                                  ),
                                ),


                                Text(
                                  '0.00',
                                  style: TextStyle(
                                    color: Color(0xFF737A91),
                                    fontSize: 12,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w500,
                                  ),
                                )

                              ],
                            ),

                            SizedBox(height: 16.0),

                            Container(
                              width: 321,
                              height: 32,
                              padding: const EdgeInsets.all(8),
                              decoration: ShapeDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(1.00, -0.00),
                                  end: Alignment(-1, 0),
                                  colors: [Color(0xFF483BEB), Color(0xFF7847E1), Color(0xFFDD568D)],
                                ),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Buy BTC',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: 'Satoshi',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 15.0),

                            Container(
                              width: 321.01,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Color(0xFFF1F1F1),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 15.0),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total account value',
                                  style: TextStyle(
                                    color: Color(0xFF737A91),
                                    fontSize: 12,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        'NGN',
                                        style: TextStyle(
                                          color: Color(0xFF737A91),
                                          fontSize: 12,
                                          fontFamily: 'Satoshi',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),

                                      SizedBox(width: 3),

                                      Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        size: 12,
                                        color: Color(0XFF737A91),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 8.0),

                            Row(
                              children: [
                                Text(
                                  '0.00',
                                  style: TextStyle(
                                    color: Color(0xFF1C2127),
                                    fontSize: 14,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 16.0),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Open Orders',
                                  style: TextStyle(
                                    color: Color(0xFF737A91),
                                    fontSize: 12,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                Text(
                                  'Available',
                                  style: TextStyle(
                                    color: Color(0xFF737A91),
                                    fontSize: 12,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 8.0),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '0.00',
                                  style: TextStyle(
                                    color: Color(0xFF1C2127),
                                    fontSize: 14,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w700,
                                    height: 0.08,
                                  ),
                                ),

                                Text(
                                  '0.00',
                                  style: TextStyle(
                                    color: Color(0xFF1C2127),
                                    fontSize: 14,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w700,
                                    height: 0.08,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 32.0),

                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 32,
                                  padding: const EdgeInsets.all(8),
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF2764FF),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Deposit',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontFamily: 'Satoshi',
                                                fontWeight: FontWeight.w700,
                                                height: 0.08,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
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
      ),
    );
  }
}