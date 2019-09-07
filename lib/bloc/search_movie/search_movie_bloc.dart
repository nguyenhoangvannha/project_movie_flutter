import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  @override
  SearchMovieState get initialState => InitialSearchMovieState();

  @override
  Stream<SearchMovieState> mapEventToState(
    SearchMovieEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
