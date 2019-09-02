import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchState extends Equatable {
  SearchState([List props = const []]) : super(props);
}

class InitialSearchState extends SearchState {}
