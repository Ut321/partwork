import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partwork/domain/usecases/get_quotes.dart';
import 'package:partwork/presentation/quotes_bloc/quotes_event.dart';
import 'package:partwork/presentation/quotes_bloc/quotes_state.dart';

// This file will contain the Bloc for managing the state of the quotes screen.

class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  final GetQuotes getQuotes;
  Timer? _timer;

  QuotesBloc({required this.getQuotes}) : super(QuotesInitial()) {
    on<FetchQuotes>(_fetchQuotes);
    on<RefreshQuotes>(_refreshQuotes);
  }

  // fetch the quotes
  void _fetchQuotes(FetchQuotes event, Emitter<QuotesState> emit) async {
    emit(QuotesLoading());
    try {
      final quotes = await getQuotes();
      emit(QuotesLoaded(quotes));
      _startTimer();
    } catch (e) {
      emit(QuotesError(e.toString()));
    }
  }

  // refresh Quotes
  void _refreshQuotes(RefreshQuotes event, Emitter<QuotesState> emit) async {
    try {
      final quotes = await getQuotes();
      emit(QuotesLoaded(quotes));
    } catch (e) {
      emit(QuotesError(e.toString()));
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      add(RefreshQuotes());
    });
  }
// dispose for the memory leak .
  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
