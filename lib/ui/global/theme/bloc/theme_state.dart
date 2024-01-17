import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class ThemeState extends Equatable {
  final ThemeData? themeData;

  ThemeState({required this.themeData}) : super();

  @override
  List<Object?> get props => [themeData];
}
