import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class SimilarMovieBloc extends Bloc<SimilarMovieEvent, SimilarMovieState> {
  @override
  SimilarMovieState get initialState => InitialSimilarMovieState();

  @override
  Stream<SimilarMovieState> mapEventToState(
    SimilarMovieEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
