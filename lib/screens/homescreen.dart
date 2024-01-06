import 'dart:async';

import 'package:flutter/material.dart';
import 'package:roqqu/screens/utils/action_button_section.dart';
import 'package:roqqu/screens/utils/chart_section.dart';
import 'package:roqqu/screens/utils/coin_data_section.dart';
import 'package:roqqu/screens/utils/custom_app_bar.dart';
import 'package:roqqu/screens/utils/order_section.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

import '../network/orderbook_web_socket.dart';
import '../network/web_socket_manager.dart';

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
              CoinDataSection(),
              SizedBox(height: 8),
              ChartSection(),
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



// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       body: CandleSection(),
//     ),
//   ));
// }






