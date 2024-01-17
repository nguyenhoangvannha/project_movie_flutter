import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  final Widget child;
  final Function? onPressed;

  const AdaptiveButton({Key? key, required this.child, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: onPressed as void Function()?, child: child)
        : OutlinedButton(
            onPressed: onPressed as void Function()?,
            child: child,
          );
  }
}
