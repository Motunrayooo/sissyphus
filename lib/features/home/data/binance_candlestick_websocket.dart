import 'dart:convert';
import 'dart:io';
import 'package:web_socket_channel/io.dart';


// class BinanceWebSocket {
//   final String symbol;
//   final String interval;
//   late IOWebSocketChannel channel;
//   Function(Map<String, dynamic>)? onDataReceived;
//
//   BinanceWebSocket({this.symbol = "btcusdt", this.interval = "1m"});
//
//   void connect() {
//     final url = 'wss://stream.binance.com:9443/ws/$symbol@kline_$interval';
//     channel = IOWebSocketChannel.connect(url);
//
//     channel.stream.listen((message) {
//       final data = jsonDecode(message);
//       final kline = data['k'];
//
//       if (onDataReceived != null) {
//         onDataReceived!({
//           "time": DateTime.fromMillisecondsSinceEpoch(kline['t']),
//           "open": double.parse(kline['o']),
//           "high": double.parse(kline['h']),
//           "low": double.parse(kline['l']),
//           "close": double.parse(kline['c']),
//         });
//       }
//     }, onError: (error) {
//       print("WebSocket Error: $error");
//     }, onDone: () {
//       print("WebSocket Disconnected");
//     });
//   }
//
//   void disconnect() {
//     channel.sink.close();
//   }
// }





class BinanceWebSocket {
  final String symbol;
  final String interval;
  IOWebSocketChannel? channel;
  Function(Map<String, dynamic>)? onDataReceived;
  bool _isConnected = false;

  BinanceWebSocket({this.symbol = "btcusdt", this.interval = "1m"});

  void connect() async {
    final url = 'wss://stream.binance.com:9443/ws/$symbol@kline_$interval';

    print("Connecting to WebSocket: $url");

    try {
      channel = IOWebSocketChannel.connect(url);
      _isConnected = true;

      channel!.stream.listen((message) {
        final data = jsonDecode(message);
        final kline = data['k'];

        if (onDataReceived != null) {
          onDataReceived!({
            "time": DateTime.fromMillisecondsSinceEpoch(kline['t']),
            "open": double.parse(kline['o']),
            "high": double.parse(kline['h']),
            "low": double.parse(kline['l']),
            "close": double.parse(kline['c']),
          });
        }
      }, onError: (error) {
        print("WebSocket Error: $error");
        // _handleReconnect();
      }, onDone: () {
        print("WebSocket Disconnected");
        // _handleReconnect();
      });
    } on SocketException catch (e) {
      print("SocketException: ${e.message}");
      _handleReconnect();
    } catch (e) {
      print("Unexpected error: $e");
      // _handleReconnect();
    }
  }

  void disconnect() {
    print("Disconnecting WebSocket...");
    _isConnected = false;
    channel?.sink.close();
  }

  void _handleReconnect() {
    if (_isConnected) {
      print("Attempting to reconnect in 5 seconds...");
      Future.delayed(Duration(seconds: 5), () {
        if (_isConnected) {
          connect();
        }
      });
    }
  }
}
