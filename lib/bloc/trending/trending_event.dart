import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TrendingEvent extends Equatable {
  TrendingEvent([List props = const []]) : super(props);
}

class Fetch extends TrendingEvent {}

class LoadMore extends TrendingEvent {}
