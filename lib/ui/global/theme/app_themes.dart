import 'theme_data/dark_theme.dart' show darkTheme;
import 'theme_data/default_theme.dart' show defaultTheme;
import 'theme_data/light_theme.dart' show lightTheme;

enum AppTheme { Default, Dark, Light }

final appThemeData = {
  AppTheme.Default: defaultTheme,
  AppTheme.Dark: darkTheme,
  AppTheme.Light: lightTheme,
};
