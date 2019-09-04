import 'package:flutter/material.dart';

import 'common/custom_container.dart';
import 'common/custom_text.dart';

class MovieOverview extends StatelessWidget {
  final String title;
  final String content;
  final String imageUrl;
  final Function onPressedButton;

  MovieOverview(
      {@required this.title,
      @required this.content,
      @required this.imageUrl,
      @required this.onPressedButton});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      final maxHeight = constraints.maxHeight;
      final maxWidth = constraints.maxWidth;
      return MediaQuery.of(context).orientation == Orientation.portrait
          ? _buildPortrait(context, maxHeight)
          : _buildLandscape(context, maxWidth);
      ;
    });
  }

  Widget _buildLandscape(BuildContext context, double maxWidth) {
    return Row(
      children: <Widget>[
        SizedBox(
          height: double.infinity,
          width: maxWidth * 0.55,
          child: RoundedCachedNetworkImage(imageUrl: imageUrl),
        ),
        Container(
          height: double.infinity,
          width: maxWidth * 0.45,
          padding: EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: TextTitle(text: title),
              ),
              SizedBox(
                height: 8,
              ),
              Expanded(child: TextContent(text: content)),
              FlatButton(
                  child: TextTitleWhite(
                    text: 'More',
                    fontSize: 16,
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: onPressedButton),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPortrait(BuildContext context, double maxHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 8),
            child: TextTitle(text: title)),
        SizedBox(
          height: maxHeight * 0.3,
          child: TextContent(text: content),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 8),
            width: double.infinity,
            child: RoundedCachedNetworkImage(
              imageUrl: imageUrl,
            ),
          ),
        ),
        FlatButton(
            child: TextTitleWhite(
              text: 'More',
              fontSize: 16,
            ),
            color: Theme.of(context).accentColor,
            onPressed: onPressedButton),
      ],
    );
  }
}
