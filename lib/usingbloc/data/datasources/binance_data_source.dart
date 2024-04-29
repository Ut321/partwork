import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

//  This file will contain the implementation of the data source for fetching data from the Binance API .  

abstract class BinanceDataSource {
  Future<List<dynamic>> getQuotes();
}

class BinanceDataSourceImpl implements BinanceDataSource {
  final Dio _dio = Dio();

  @override
  Future<List<dynamic>> getQuotes() async {
    try {
      final response = await _dio.get(dotenv.env['BINANCE_API_URL'] ?? " ");
      if (response.statusCode == 200) {
        final data = response.data;
        final asks = List<dynamic>.from(data['asks']);
        final bids = List<dynamic>.from(data['bids']);
        return [...bids, ...asks];
      } else {
        throw Exception('Failed to fetch data from Binance API');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
