import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  final BorderRadius borderRadius;
  final double elevation;
  final double borderWidth;
  final EdgeInsetsGeometry margin;
  final Color? color;
  final Color borderColor;

  const CustomCard(
      {Key? key,
      this.child,
      this.borderRadius = const BorderRadius.all(Radius.circular(8)),
      this.elevation = 2,
      this.borderWidth = 0.0,
      this.margin = const EdgeInsets.all(0),
      this.color,
      this.borderColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.black38
        : Colors.white30;
    return Card(
      margin: margin,
      color: color ?? brightColor,
      elevation: elevation,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: BorderSide(color: borderColor, width: borderWidth)),
      child: child,
    );
  }
}

class RoundedBackground extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? color;
  final double? width;
  final EdgeInsetsGeometry? margin;

  const RoundedBackground(
      {Key? key,
      required this.child,
      this.padding = const EdgeInsets.all(0),
      this.width,
      this.margin = const EdgeInsets.all(0),
      this.borderRadius,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? brightColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.black38
        : Colors.white30;
    if (color != null) brightColor = color;
    return Container(
      width: width ?? double.infinity,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          color: brightColor),
      child: child,
    );
  }
}
