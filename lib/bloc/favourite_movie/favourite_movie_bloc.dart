import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class FavouriteMovieBloc extends Bloc<FavouriteMovieEvent, FavouriteMovieState> {
  @override
  FavouriteMovieState get initialState => InitialFavouriteMovieState();

  @override
  Stream<FavouriteMovieState> mapEventToState(
    FavouriteMovieEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
