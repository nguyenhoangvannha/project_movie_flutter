import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_movie/data/respository/entity/movie.dart';

@immutable
abstract class FavoriteEvent extends Equatable {
  FavoriteEvent([List props = const []]) : super(props);
}

class LoadFavorite extends FavoriteEvent {}

class CheckFavorite extends FavoriteEvent {
  final int movieId;

  CheckFavorite({@required this.movieId}) :super([movieId]);
}

class AddFavorite extends FavoriteEvent {
  final Movie movie;

  AddFavorite({@required this.movie}) :super([movie]);
}

class RemoveFavorite extends FavoriteEvent {
  final int movieId;

  RemoveFavorite({@required this.movieId}) :super([movieId]);
}
