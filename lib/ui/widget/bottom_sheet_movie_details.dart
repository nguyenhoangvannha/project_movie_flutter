import 'package:flutter/material.dart';
import 'package:project_movie_flutter/data/respository/entity/movie.dart';
import 'package:project_movie_flutter/global/config/navigator.dart';

import './common/custom.dart' as Custom;
import 'common/custom.dart';
import 'star_button.dart';

class BottomSheetMovies extends StatelessWidget {
  final Movie movie;

  BottomSheetMovies({@required this.movie});

  @override
  Widget build(BuildContext context) {
    //return Center(child: Text(movie.toString()),);
    return RoundedRectangle(
      padding: EdgeInsets.all(8),
      child: LayoutBuilder(builder: (_, constraints) {
        final maxHeight = constraints.maxHeight;
        final maxWidth = constraints.maxWidth;
        return MediaQuery
            .of(context)
            .orientation == Orientation.portrait
            ? _buildPortrait(context, maxHeight)
            : _buildLandscape(context, maxWidth);
        ;
      }),
    );
  }

  _navToDetailsPage(BuildContext context, Movie movie) {
    AppNavigator.instance
        .navToDetailsPage(context, movie.id, fromBottomSheet: true);
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
                  child: Custom.CustomNetworkImage(
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
                trailing: StarButton(
                  movie: movie,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Expanded(child: Text(movie.overview)),
              MaterialButton(
                  child: Text('More'),
                  color: Theme
                      .of(context)
                      .accentColor,
                  onPressed: () => _navToDetailsPage(context, movie)),
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
          trailing: StarButton(
            movie: movie,
          ),
        ),
        SizedBox(
          height: maxHeight * 0.25,
          child: SingleChildScrollView(child: Text(movie.overview)),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 8),
            width: double.infinity,
            child: Card(
                elevation: 1,
                child: Custom.RoundedBackground(
                    child: Custom.CustomNetworkImage(
                      imageUrl: movie.posterPath,
                      boxFit: BoxFit.fill,
                    ))),
          ),
        ),
        MaterialButton(
            child: Text('More'),
            color: Theme
                .of(context)
                .accentColor,
            onPressed: () => _navToDetailsPage(context, movie)),
      ],
    );
  }
}
