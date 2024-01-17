import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String text;
  final int maxLines;
  final double fontSize;

  TextTitle(this.text, {this.maxLines = 1, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          Theme.of(context).textTheme.titleMedium.copyWith(fontSize: fontSize),
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
    );
  }
}

class TextSubtitle extends StatelessWidget {
  final String text;

  TextSubtitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .titleSmall
          .copyWith(fontSize: 12, fontStyle: FontStyle.normal),
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}

class TextCaption extends StatelessWidget {
  final String text;

  TextCaption(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.caption.copyWith(fontSize: 12),
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}

class TextBody1 extends StatelessWidget {
  final String text;
  final int maxLines;

  TextBody1(this.text, {this.maxLines = 5});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
    );
  }
}

class ExpandableText extends StatefulWidget {
  final String text;

  ExpandableText(this.text);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _expanded
            ? Text(
                widget.text,
                softWrap: true,
              )
            : Text(
                widget.text,
                maxLines: 5,
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
        Center(
          child: IconButton(
              icon: Icon(_expanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              }),
        )
      ],
    );
  }
}
