import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  @override
  MovieDetailState get initialState => InitialMovieDetailState();

  @override
  Stream<MovieDetailState> mapEventToState(
    MovieDetailEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
