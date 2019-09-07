import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class RecommendationMovieBloc extends Bloc<RecommendationMovieEvent, RecommendationMovieState> {
  @override
  RecommendationMovieState get initialState => InitialRecommendationMovieState();

  @override
  Stream<RecommendationMovieState> mapEventToState(
    RecommendationMovieEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
