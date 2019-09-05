import 'package:flutter/material.dart';

import 'custom_text.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: CircularProgressIndicator(),
          ),
          SizedBox(height: 12,),
          TextSubtitle(text: 'Loading...',)
        ],
      ),
    );
  }
}
