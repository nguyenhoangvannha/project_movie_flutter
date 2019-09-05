import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String text;
  final int maxLines;
  final TextAlign textAlign;
  final EdgeInsetsGeometry padding;
  final TextStyle textStyle;

  TextTitle(
      {@required this.text,
        this.textStyle,
      this.maxLines,
      this.textAlign,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(0),
      child: Text(
        text,
        textAlign: textAlign ?? TextAlign.start,
        style: textStyle ?? Theme
            .of(context)
            .textTheme
            .title,
        maxLines: maxLines ?? 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class TextSubtitle extends StatelessWidget {
  final String text;
  final int maxLines;
  final TextAlign textAlign;
  final TextStyle textStyle;

  TextSubtitle(
      {@required this.text,
        this.textStyle,
      this.maxLines,
        this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: textStyle ?? Theme
          .of(context)
          .textTheme
          .subtitle,
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class TextContent extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final TextStyle textStyle;

  TextContent({@required this.text, this.textStyle, this.textAlign});

  @override
  Widget build(BuildContext context) {
    final overflow = TextOverflow.fade;
    return SingleChildScrollView(
      padding: EdgeInsets.all(4),
      child: Text(
        text,
        textAlign: textAlign ?? TextAlign.start,
        style: textStyle ?? Theme
            .of(context)
            .textTheme
            .body1,
        softWrap: true,
        overflow: overflow,
      ),
    );
  }
}
