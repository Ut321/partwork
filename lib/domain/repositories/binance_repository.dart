import 'package:partwork/domain/entities/quote.dart';


//  This file will contain the abstract repository class that defines the contract for fetching quotes.

abstract class BinanceRepository {
  Future<List<Quote>> getQuotes();
}