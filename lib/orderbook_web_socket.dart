import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class OrderbookWebSocketManager {
  late IOWebSocketChannel _webSocketChannel;

  OrderbookWebSocketManager(String symbol) {
    _webSocketChannel = IOWebSocketChannel.connect(
      'wss://stream.binance.com:9443/ws/$symbol@depth',
    );
  }

  Stream<Map<String, dynamic>> getOrderbookDataStream() {
    return _webSocketChannel.stream.map((data) => _parseOrderbookData(data));
  }

  Map<String, dynamic> _parseOrderbookData(dynamic data) {
    // Parse the JSON string into a Map
    Map<String, dynamic> decodedData = Map<String, dynamic>.from(jsonDecode(data));

    return decodedData;
  }


  void dispose() {
    _webSocketChannel.sink.close();
  }
}