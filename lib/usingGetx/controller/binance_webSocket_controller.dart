import 'dart:convert';
import 'package:get/get.dart';
import 'package:partwork/usingGetx/model/binance_data.dart';
import 'package:web_socket_channel/io.dart';

class BinanceDataController extends GetxController {
  late final IOWebSocketChannel channel;
  var tasks = <BinanceData>[].obs;
  var bids = <BinanceData>[].obs;

  @override
  void onInit() {
    super.onInit();
    channel = IOWebSocketChannel.connect(
      'wss://stream.binance.com:9443/ws/btcusdt@depth',
      pingInterval: const Duration(seconds: 10),
    );

    channel.stream.listen((message) {
      if (message != null) {
        try {
          dynamic data = jsonDecode(message);

          if (data is Map<String, dynamic>) {
            List<BinanceData> newTasks = (data['a'] as List<dynamic>?)
                    ?.map((e) => BinanceData(
                          double.tryParse(e[0].toString()) ?? 0.0,
                          double.tryParse(e[1].toString()) ?? 0.0,
                        ))
                    .toList() ??
                [];
            List<BinanceData> newBids = (data['b'] as List<dynamic>?)
                    ?.map((e) => BinanceData(
                          double.tryParse(e[0].toString()) ?? 0.0,
                          double.tryParse(e[1].toString()) ?? 0.0,
                        ))
                    .toList() ??
                [];

            // Update tasks data

            tasks.assignAll(newTasks);

            // Update bids data

            bids.assignAll(newBids);
          } else {
            print('Unknown data format: $data');
          }
        } catch (e) {
          print('Error decoding message: $e');
        }
      }
    }, onError: (error) {
      print('WebSocket error: $error');
    });
  }

  @override
  void onClose() {


    // Close WebSocket connection

    channel.sink.close();
    super.onClose();
  }
}
