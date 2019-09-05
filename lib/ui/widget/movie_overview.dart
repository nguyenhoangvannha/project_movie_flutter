import 'package:flutter/material.dart';
import 'package:project_movie/data/respository/entity/movie.dart';

import 'common/custom.dart' as Custom;

class MovieOverview extends StatelessWidget {
  final Movie movie;
  final Function onPressedButton;

  MovieOverview({@required this.movie, @required this.onPressedButton});

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
          child: Card(
              elevation: 8,
              child: Custom.RoundedBackground(
                  child: Custom.NetworkImage(
                    imageUrl: movie.posterPath,
                    boxFit: BoxFit.fill,
                  ))),
        ),
        Container(
          height: double.infinity,
          width: maxWidth * 0.45,
          padding: EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              ListTile(
                title: Text(
                  movie.title,
                  style: Theme
                      .of(context)
                      .textTheme
                      .title,
                  textAlign: TextAlign.start,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  onPressed: null,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Expanded(child: Text(movie.overview)),
              FlatButton(
                  child: Text('More'),
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
        ListTile(
          selected: true,
          title: Text(
            movie.title,
            style: Theme
                .of(context)
                .textTheme
                .title,
            textAlign: TextAlign.start,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            onPressed: null,
          ),
        ),
        SizedBox(
          height: maxHeight * 0.25,
          child: Text(movie.overview),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 8),
            width: double.infinity,
            child: Card(
                elevation: 1,
                child: Custom.RoundedBackground(
                    child: Custom.NetworkImage(
                      imageUrl: movie.posterPath,
                      boxFit: BoxFit.fill,
                    ))),
          ),
        ),
        FlatButton(
            child: Text('More'),
            color: Theme.of(context).accentColor,
            onPressed: onPressedButton),
      ],
    );
  }
}
