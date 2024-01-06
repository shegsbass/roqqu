<iframe width="560" height="315" src="https://youtube.com/shorts/QPieEVxV5SA?si=Zpl-aArQQoHkOV-0&autoplay=1" frameborder="0" allowfullscreen></iframe>

# Roqqu Flutter C"rypto Trading App (Assessment)

This Flutter application demonstrates a simple crypto trading app with real-time price updates, candlestick charts, order book data, and recent trades. It utilizes WebSocket communication to receive live data from the Binance API.

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

## Usage

## Clone the repository:

'git clone https://github.com/your-username/flutter-crypto-trading-app.git'

Open the project in your preferred Flutter development environment.

Run the app on an emulator or physical device.

## Dependencies
- flutter
- syncfusion_flutter_charts

## Notes
This app uses WebSocket communication to receive real-time data. Ensure a stable internet connection for proper functionality.
Customize the app as needed for your specific use case.
Feel free to contribute to the project, report issues, or suggest improvements!

