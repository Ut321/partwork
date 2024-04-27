

//: This file will contain the events that the QuotesBloc will handle.

abstract class QuotesEvent {}

class FetchQuotes extends QuotesEvent {}

class RefreshQuotes extends QuotesEvent {}