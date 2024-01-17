import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:project_movie_flutter/component/routes.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';
import 'package:project_movie_flutter/domain/entity/video.dart';
import 'package:project_movie_flutter/ui/feature/detail/bottom_sheet_movie_details.dart';
import 'package:project_movie_flutter/ui/feature/detail/bottom_sheet_video_trailer.dart';
import 'package:project_movie_flutter/ui/feature/search/movie_search_delegate.dart';
import 'package:project_movie_flutter/ui/global/localizations/app_localizations.dart';
import 'package:project_movie_flutter/ui/widget/bottom_sheet_edit_movie.dart';
import 'package:project_movie_flutter/ui/widget/bottom_sheet_sort.dart';
import 'package:project_movie_flutter/util/movie_sort_type.dart';

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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        context: context,
        builder: (bCtx) {
          return BottomSheetMovies(movie: movie);
        });
  }

  void showBottomSheetMovieVideoTrailer(BuildContext context, Video video) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        context: context,
        builder: (bCtx) {
          return BottomSheetVideoTrailer(
            title: video.name,
            videoKey: video.key,
          );
        });
  }

  void showBottomSheetEditMovie(BuildContext context, Movie movie) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        context: context,
        builder: (bCtx) {
          return BottomSheetEditMovie(movie);
        });
  }

  void showBottomSheetShortMovies(
      BuildContext context,
      SortType currentSortType,
      Function(SortType newSortType) onSortTypeChanged) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (bCtx) {
          return BottomSheetSort(
            currentSortType: currentSortType,
            onSortTypeChanged: onSortTypeChanged,
          );
        });
  }

  void showAlertDialog(BuildContext context,
      {@required Widget content,
      Widget title = const Text("Attention"),
      List<Widget> actions}) {
    if (actions == null) {
      actions = [];
    }
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: title,
            content: content,
            actions: actions
              ..add(TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child:
                    Text(AppLocalizations.of(context).translate('act_close')),
              )),
          );
        },
      );
    });
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
