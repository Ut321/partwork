

import 'package:partwork/data/datasources/binance_data_source.dart';
import 'package:partwork/domain/entities/quote.dart';
import 'package:partwork/domain/repositories/binance_repository.dart';


//  This file will contain the implementation of the repository that uses the BinanceDataSource.


class BinanceRepositoryImpl implements BinanceRepository {
  final BinanceDataSource dataSource;

  BinanceRepositoryImpl(this.dataSource);

  @override
  Future<List<Quote>> getQuotes() async {
    final quotes = await dataSource.getQuotes();
    return quotes.map((quote) => Quote.fromJson(quote)).toList();
  }
}