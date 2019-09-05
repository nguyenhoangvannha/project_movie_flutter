import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String message;

  ErrorView({this.message = 'Unknown state'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 8,
        color: Theme
            .of(context)
            .errorColor,
        child: MaterialButton(onPressed: null, child: Text(message),),
      ),
    );
  }
}
