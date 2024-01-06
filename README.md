![](https://github.com/shegsbass/roqqu/blob/master/roqqu-assess.gif)

# Roqqu Flutter Crypto Trading App (Assessment)

This Flutter application demonstrates a simple crypto trading app with real-time price updates, candlestick charts, order book data, and recent trades. It utilizes WebSocket communication to receive live data from the Binance API.

## WebSockets API Integration

The project successfully integrates with the Binance WebSocket API for fetching real-time data on Candlestick patterns and Orderbook updates. The Candlestick chart provides an interactive UI, allowing users to visualize historical price movements.

## Features

- WebSocketManager: Manages WebSocket connections for retrieving real-time candlestick chart data.
```
import 'dart:convert';
import 'package:web_socket_channel/io.dart';

class WebSocketManager {
  late double currentPrice;
  late List<ChartData> chartData;
  late IOWebSocketChannel channel;
  late Function onPriceUpdate; // Callback function

  WebSocketManager(String symbol, this.onPriceUpdate) {
    // ... (see the provided code)
  }

  // ... (see the provided code)
}
```

- OrderbookWebSocketManager: Manages WebSocket connections for retrieving real-time order book data.
```
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class OrderbookWebSocketManager {
  // ... (see the provided code)
}
```

- CandleSection Widget: Displays a tabbed interface with three tabs: Charts, Orderbook, and Recent Trades. Each tab has its corresponding content.
```
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:convert';

import 'package:web_socket_channel/io.dart';
import 'dart:convert';

import '../orderbook_web_socket.dart';
import '../web_socket_manager.dart';

class CandleSection extends StatefulWidget {
  // ... (see the provided code)
}
```

- CandlestickChart Widget: Displays a candlestick chart using the Syncfusion Flutter Charts library.
```
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CandlestickChart extends StatefulWidget {
  // ... (see the provided code)
}```

- ChartData Class: Represents the data structure for candlestick chart data.
```class ChartData {
  // ... (see the provided code)
}
```

## State Management

For simplicity and the scope of this project, I decided not to incorporate a specific state management solution. The application's state is managed within the individual widgets, and I leverage Flutter's built-in StatefulWidget for handling local state where needed. For complex projects, adopting a state management solution like Provider, Riverpod, or Bloc will be considered for better scalability and maintainability.

## Constraints

While I was able to fetch real-time data for Orderbooks through the Binance API, due to time constraints, I was unable to implement the UI/UX design for the Orderbook section. However, I focused on fetching the data and delivering a responsive interface for the Candlestick chart section.

## Usage

## Clone the repository:

'git clone https://github.com/shegsbass/roqqu'

Open the project in your preferred Flutter development environment.

Run the app on an emulator or physical device.

## Dependencies
- flutter
- web_socket_channel
- syncfusion_flutter_charts

## Notes
This app uses WebSocket communication to receive real-time data. Ensure a stable internet connection for proper functionality. 
