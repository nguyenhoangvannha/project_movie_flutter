import 'package:project_movie_flutter/ui/feature/detail/detail_page.dart';
import 'package:project_movie_flutter/ui/feature/home/home_page.dart';
import 'package:project_movie_flutter/ui/feature/setting/setting_page.dart';
import 'package:project_movie_flutter/ui/global/localizations/ui/localizations_settings_page.dart';
import 'package:project_movie_flutter/ui/global/theme/ui/themes_setting_page.dart';

class Routes {
  static const String MAIN = '/';
  static const String MOVIE_DETAILS = '/movie/details';
  static const String BOTTOM_SHEET_MOVIE = '/bottom_sheet/movie';
  static const String SETTINGS = '/settings';
  static const String SETTINGS_THEMES = '/settings/themes';
  static const String SETTINGS_LANGUAGES = '/settings/languages';

  static var routes = {
    MAIN: (ctx) => HomePage(),
    MOVIE_DETAILS: (ctx) => DetailPage(),
    SETTINGS: (ctx) => SettingsPage(),
    SETTINGS_THEMES: (ctx) => ThemeSettingPage(),
    SETTINGS_LANGUAGES: (ctx) => LocalizationsSettingPage(),
  };
}
