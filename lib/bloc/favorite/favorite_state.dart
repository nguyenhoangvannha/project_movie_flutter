import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FavoriteState extends Equatable {
  FavoriteState([List props = const []]) : super(props);
}

class InitialFavoriteState extends FavoriteState {}

class LoadingFavorite extends FavoriteState {}

class NoFavorite extends FavoriteState {}

class HasFavorite extends FavoriteState {}
