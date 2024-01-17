import 'package:intl/intl.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';

import 'movie_sort_type.dart';

class SortUtil {
  static void sortListMovie(List<Movie>? items, SortType sortType) {
    switch (sortType) {
      case SortType.name_inc:
        items!.sort((item1, item2) {
          return item1.title!.compareTo(item2.title!);
        });
        break;
      case SortType.name_dec:
        items!.sort((item1, item2) {
          return item2.title!.compareTo(item1.title!);
        });
        break;
      case SortType.date_inc:
        items!.sort((item1, item2) {
          var d1 = DateFormat('yyyy-MM-dd', "en_US").parse(item1.releaseDate!);
          var d2 = DateFormat('yyyy-MM-dd', "en_US").parse(item2.releaseDate!);
          if (d2 != null) {
            return d1.compareTo(d2);
          } else {
            return 0;
          }
        });
        break;
      case SortType.date_dec:
        items!.sort((item1, item2) {
          var d1 = DateFormat('yyyy-MM-dd', "en_US").parse(item1.releaseDate!);
          var d2 = DateFormat('yyyy-MM-dd', "en_US").parse(item2.releaseDate!);
          if (d2 != null) {
            return d2.compareTo(d1);
          } else {
            return 0;
          }
        });
        break;
      case SortType.popular_inc:
        items!.sort((item1, item2) {
          return item1.popularity!.compareTo(item2.popularity!);
        });
        break;
      case SortType.popular_dec:
        items!.sort((item1, item2) {
          return item2.popularity!.compareTo(item1.popularity!);
        });
        break;
    }
  }
}
