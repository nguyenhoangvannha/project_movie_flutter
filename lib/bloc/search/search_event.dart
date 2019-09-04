import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchEvent extends Equatable {
  SearchEvent([List props = const []]) : super(props);
}

class SearchEmpty extends SearchEvent {}

class Search extends SearchEvent {
  final String query;

  Search({this.query});

}

class Searching extends SearchEvent {}

class ShowResults extends SearchEvent {}

class ShowSuggestions extends SearchEvent {}