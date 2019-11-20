import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;

  AdaptiveButton({@required this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(child: this.child, onPressed: this.onPressed)
        : OutlineButton(
            child: this.child,
            onPressed: this.onPressed,
          );
  }
}
