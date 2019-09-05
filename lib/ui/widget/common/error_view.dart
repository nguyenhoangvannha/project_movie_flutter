import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String message;

  ErrorView({this.message = 'Unknown state'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
