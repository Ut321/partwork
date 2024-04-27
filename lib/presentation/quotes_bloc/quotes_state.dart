import 'package:partwork/domain/entities/quote.dart';

// This file will contain the states that the QuotesBloc can be in.

abstract class QuotesState {}

class QuotesInitial extends QuotesState {}

class QuotesLoading extends QuotesState {}

class QuotesLoaded extends QuotesState {
  final List<Quote> quotes;

  QuotesLoaded(this.quotes);
}

class QuotesError extends QuotesState {
  final String message;

  QuotesError(this.message);
}