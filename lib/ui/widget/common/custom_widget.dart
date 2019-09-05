import 'package:flutter/material.dart';

import 'custom_container.dart';
import 'custom_text.dart';

class MaterialIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final Function onPressed;
  final double iconSize;

  MaterialIconButton(
      {@required this.icon,
      this.color,
      this.backgroundColor,
      this.onPressed,
      this.iconSize});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: backgroundColor != null ? backgroundColor : Colors.black,
            padding: EdgeInsets.all(8),
            child: Icon(
              icon,
              color: color != null ? color : Colors.green,
              size: iconSize != null ? iconSize : 32,
            ),
          ),
        ),
        onTap: onPressed);
  }
}

class MaterialButtonX extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final Function onPressed;
  final double iconSize;
  final Widget title;
  final EdgeInsetsGeometry margin;

  MaterialButtonX(
      {@required this.icon,
      this.color,
      this.backgroundColor,
      this.onPressed,
      this.iconSize,
      this.title,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: backgroundColor != null ? backgroundColor : Colors.black,
            padding: EdgeInsets.all(4),
            margin: margin != null ? margin : EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                title,
                SizedBox(
                  width: 4,
                ),
                Icon(
                  icon,
                  color: color != null ? color : Colors.green,
                  size: iconSize != null ? iconSize : 24,
                )
              ],
            ),
          ),
        ),
        onTap: onPressed);
  }
}

class MaterialLabel extends StatelessWidget {
  final String text;

  MaterialLabel({@required this.text});

  @override
  Widget build(BuildContext context) {
    return RoundedBlurContainer(
      child: TextTitle(
        text: text,
      ),
      color: Colors.red,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
