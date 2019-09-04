import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_movie/data/respository/entity/movie.dart';

import './bloc.dart';
import '../../data/respository/movie_repository.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final MovieRepository repository;

  FavoriteBloc({@required this.repository});

  List<Movie> movies = [];

  @override
  FavoriteState get initialState => InitialFavoriteState();

  @override
  Stream<FavoriteState> mapEventToState(
    FavoriteEvent event,
  ) async* {
    if (event is LoadFavorite) {
      yield LoadingFavorite();
      movies.addAll(await repository.getFavoriteMovies());
      if (movies.length > 0) {
        yield HasFavorite();
      } else {
        yield NoFavorite();
      }
    }
  }
}
