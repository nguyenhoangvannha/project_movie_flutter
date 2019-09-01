import 'package:flutter/foundation.dart';

class Movie extends ChangeNotifier {
  int _id = 0;
  String _title = "";
  String _overview;

  Movie.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _overview = json['overview'];
    _title = json['title'];
  }

  String get overview => _overview;

  set overview(String value) {
    _overview = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}