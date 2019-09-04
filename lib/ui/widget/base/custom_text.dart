import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final int maxLines;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry padding;

  TextTitle(
      {@required this.text,
      this.color,
      this.fontSize,
      this.maxLines,
      this.textAlign,
      this.fontWeight,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(0),
      child: Text(
        text,
        textAlign: textAlign ?? TextAlign.start,
        style: TextStyle(
            color: color ?? Colors.black,
            fontWeight: fontWeight ?? FontWeight.bold,
            fontSize: fontSize ?? 20),
        maxLines: maxLines ?? 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class TextTitleWhite extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final int maxLines;
  final TextAlign textAlign;

  TextTitleWhite(
      {@required this.text,
      this.color,
      this.fontSize,
      this.maxLines,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(
          color: color ?? Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: fontSize ?? 18),
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class TextSubtitle extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final int maxLines;
  final TextAlign textAlign;
  final FontWeight fontWeight;

  TextSubtitle(
      {@required this.text,
      this.color,
      this.fontSize,
      this.maxLines,
      this.textAlign,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
          color: color ?? Colors.black54,
          fontWeight: fontWeight ?? FontWeight.bold,
          fontSize: fontSize ?? 14),
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class TextContent extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final TextAlign textAlign;

  TextContent({@required this.text, this.color, this.fontSize, this.textAlign});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
        color: color ?? Colors.black87,
        fontWeight: FontWeight.normal,
        fontSize: fontSize ?? 14);
    final overflow = TextOverflow.fade;
    return SingleChildScrollView(
      padding: EdgeInsets.all(4),
      child: Text(
        text,
        textAlign: textAlign ?? TextAlign.start,
        style: style,
        softWrap: true,
        overflow: overflow,
      ),
    );
  }
}
