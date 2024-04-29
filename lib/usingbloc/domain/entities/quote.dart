
// This file will contain the entity class representing a quote.

class Quote {
  final String symbol;
  final double bid;
  final double ask;

  Quote({required this.symbol, required this.bid, required this.ask});

  factory Quote.fromJson(List<dynamic> json) {
    return Quote(
      symbol: 'BTCUSDT',
      bid: double.parse(json[0].toString()),
      ask: double.parse(json[1].toString()),
    );
  }
}