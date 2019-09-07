import 'package:project_movie/ui/feature/detail/bottom_sheet_movie_details.dart';
import 'package:project_movie/ui/feature/home/home_page.dart';

class Routes {
  static const String MAIN = '/';
  static const String MOVIE_DETAILS = '/movie/details';
  static const String BOTTOM_SHEET_MOVIE = '/bottom_sheet/movie';

  static var routes = {
    MAIN: (ctx) => HomePage(),
    MOVIE_DETAILS: (ctx) => BottomSheetMovies(
          movieId: -1,
        )
  };
}
