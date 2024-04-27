import 'package:partwork/domain/entities/quote.dart';
import 'package:partwork/domain/repositories/binance_repository.dart';

// This file will contain the use case for getting quotes.

class GetQuotes {
  final BinanceRepository repository;

  GetQuotes(this.repository);

  Future<List<Quote>> call() async {
    return await repository.getQuotes();
  }
}