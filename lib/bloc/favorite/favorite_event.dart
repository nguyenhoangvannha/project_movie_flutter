import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FavoriteEvent extends Equatable {
  FavoriteEvent([List props = const []]) : super(props);
}

class LoadFavorite extends FavoriteEvent {}
