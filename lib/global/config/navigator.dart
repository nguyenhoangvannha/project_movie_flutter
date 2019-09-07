import 'package:flutter/material.dart';
import 'package:project_movie_flutter/data/respository/entity/movie.dart';
import 'package:project_movie_flutter/global/config/routes.dart';
import 'package:project_movie_flutter/ui/feature/search/movie_search_delegate.dart';
import 'package:project_movie_flutter/ui/widget/bottom_sheet_movie_details.dart';

class AppNavigator {
  static AppNavigator _instance;

  AppNavigator._();

  static AppNavigator get instance {
    if (_instance == null) {
      _instance = AppNavigator._();
    }
    return _instance;
  }

  void navToSearch(BuildContext context) {
    showSearch(context: context, delegate: MovieSearchDelegate());
  }

  void navToSetting(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.SETTINGS);
  }

  void navToThemeSetting(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.SETTINGS_THEMES);
  }

  void navToLanguagesSetting(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.SETTINGS_LANGUAGES);
  }

  void navToDetailsPage(BuildContext context, int movieId,
      {bool fromBottomSheet = false}) {
    if (fromBottomSheet) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).pushNamed(Routes.MOVIE_DETAILS, arguments: movieId);
  }

  void showBottomSheetMovieDetails(BuildContext context, Movie movie) {
    showModalBottomSheet(
        context: context,
        builder: (bCtx) {
          return BottomSheetMovies(
            movie: movie,
          );
        });
  }
}
