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
      padding: padding != null ? padding : EdgeInsets.all(0),
      child: Text(
        text,
        textAlign: textAlign != null ? textAlign : TextAlign.start,
        style: TextStyle(
            color: color != null ? color : Colors.black,
            fontWeight: fontWeight != null ? fontWeight : FontWeight.bold,
            fontSize: fontSize != null ? fontSize : 20),
        maxLines: maxLines != null ? maxLines : 1,
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
      textAlign: textAlign != null ? textAlign : TextAlign.center,
      style: TextStyle(
          color: color != null ? color : Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: fontSize != null ? fontSize : 18),
      maxLines: maxLines != null ? maxLines : 1,
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
      textAlign: textAlign != null ? textAlign : TextAlign.start,
      style: TextStyle(
          color: color != null ? color : Colors.black54,
          fontWeight: fontWeight != null ? fontWeight : FontWeight.bold,
          fontSize: fontSize != null ? fontSize : 14),
      maxLines: maxLines != null ? maxLines : 1,
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
    final textAlignVal = textAlign != null ? textAlign : TextAlign.start;
    final style = TextStyle(
        color: color != null ? color : Colors.black87,
        fontWeight: FontWeight.normal,
        fontSize: fontSize != null ? fontSize : 14);
    final overflow = TextOverflow.fade;
    return SingleChildScrollView(
      padding: EdgeInsets.all(4),
      child: Text(
        text,
        textAlign: textAlignVal,
        style: style,
        softWrap: true,
        overflow: overflow,
      ),
    );
  }
}
