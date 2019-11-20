import 'package:flutter/material.dart';
import 'package:project_movie_flutter/component/navigator.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';
import 'package:project_movie_flutter/ui/global/localizations/app_localizations.dart';
import 'package:project_movie_flutter/ui/widget/common/adaptive_button.dart';
import 'package:project_movie_flutter/ui/widget/common/cached_image.dart';
import 'package:project_movie_flutter/ui/widget/common/text.dart';
import 'package:project_movie_flutter/ui/widget/star_button.dart';
import 'package:swipedetector/swipedetector.dart';

class BottomSheetMovies extends StatelessWidget {
  final Movie movie;

  BottomSheetMovies({@required this.movie});

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context);
    return SwipeDetector(
      onSwipeUp: () => _navToDetailsPage(context, movie),
      onSwipeLeft: () => _navToDetailsPage(context, movie),
      child: LayoutBuilder(builder: (_, constraints) {
        final maxHeight = constraints.maxHeight;
        final maxWidth = constraints.maxWidth;
        return MediaQuery
            .of(context)
            .orientation == Orientation.portrait
            ? _buildPortrait(context, maxHeight, translator)
            : _buildLandscape(context, maxWidth, translator);
      }),
    );
  }

  Widget _buildLandscape(
      BuildContext context, double maxWidth, AppLocalizations translator) {
    return Container(
      padding: EdgeInsets.only(top: 12, left: 8, right: 8, bottom: 4),
      child: Row(
        children: <Widget>[
          SizedBox(
            height: double.infinity,
            width: maxWidth * 0.5,
            child: _movieImage(),
          ),
          Container(
            height: double.infinity,
            width: maxWidth * 0.45,
            padding: EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                _movieTitle(),
                SizedBox(height: 8),
                Expanded(
                    child: TextBody1(
                      movie.overview,
                      maxLines: 6,
                    )),
                _moreButton(context, translator),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPortrait(
      BuildContext context, double maxHeight, AppLocalizations translator) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _movieTitle(),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: maxHeight * 0.2,
            child: TextBody1(movie.overview),
          ),
          SizedBox(height: 8),
          Expanded(child: _movieImage()),
          _moreButton(context, translator),
        ],
      ),
    );
  }

  _movieImage() {
    return Card(
        elevation: 4,
        child: CachedImage(
          image: movie.posterPath,
          fit: BoxFit.cover,
        ));
  }

  _movieTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: 8),
        Expanded(child: TextTitle(movie.title)),
        StarButton(movie: movie)
      ],
    );
  }

  _moreButton(BuildContext context, AppLocalizations translator) {
    return AdaptiveButton(
        child: Text(translator.translate('act_more')),
        onPressed: () => _navToDetailsPage(context, movie));
  }

  _navToDetailsPage(BuildContext context, Movie movie) {
    AppNavigator.instance
        .navToDetailsPage(context, movie.id, fromBottomSheet: true);
  }
}
