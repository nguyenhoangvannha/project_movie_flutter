import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie_flutter/ui/global/localizations/app_localizations.dart';
import 'package:project_movie_flutter/ui/global/localizations/bloc/bloc.dart';
import 'package:project_movie_flutter/ui/global/localizations/localizations_delegates.dart';
import 'package:project_movie_flutter/ui/global/theme/app_themes.dart';
import 'package:project_movie_flutter/ui/global/theme/bloc/bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage();

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkTheme = false;
  Locale _currentLocale;

  bool alreadyInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!alreadyInit) {
      setState(() {
        _darkTheme = Theme.of(context).brightness == Brightness.dark;
        _currentLocale = Localizations.localeOf(context);
      });
      alreadyInit = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(translator.translate('title_settings')),
      ),
      body: _buildBody(context, translator),
    );
  }

  Widget _buildBody(BuildContext context, AppLocalizations translator) {
    return ListView(
      children: <Widget>[
        _buildThemeItem(translator),
        Divider(
          indent: 8,
          endIndent: 8,
          thickness: 0,
          height: 1,
        ),
        _buildLanguageItem(translator),
      ],
    );
  }

  Widget _buildThemeItem(AppLocalizations translator) {
    return Card(
      shape: BeveledRectangleBorder(),
      elevation: 1,
      margin: EdgeInsets.all(0),
      child: ListTile(
          leading: Icon(Icons.format_paint),
          title: Text(translator.translate('title_themes_dark')),
          trailing: Switch.adaptive(
            value: _darkTheme,
            onChanged: (darkTheme) {
              _changeTheme();
            },
          ),
          onTap: _changeTheme),
    );
  }

  Widget _buildLanguageItem(AppLocalizations translator) {
    final supportedLocales = LocalizationsDelegates.instance.supportedLocales;
    return Card(
      shape: BeveledRectangleBorder(),
      elevation: 1,
      margin: EdgeInsets.all(0),
      child: ListTile(
        leading: Icon(Icons.language),
        title: Text(translator.translate('title_languages')),
        trailing: DropdownButton<Locale>(
          value: _currentLocale,
          icon: Icon(Icons.arrow_downward),
          iconSize: 18,
          elevation: 16,
          onChanged: (Locale newValue) {
            _changeLanguage(newValue);
          },
          items:
              supportedLocales.map<DropdownMenuItem<Locale>>((Locale locale) {
            return DropdownMenuItem<Locale>(
              value: locale,
              child: SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    //Icon(FontAwesomeIcons.globeAfrica, size: 16,),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      translator.translate(locale.toString()),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        //onTap: () => AppNavigator.instance.navToLanguagesSetting(context),
      ),
    );
  }

  void _changeLanguage(Locale locale) {
    setState(() {
      _currentLocale = locale;
      BlocProvider.of<LocalizationsBloc>(context)
          .add(LocaleChanged(locale: _currentLocale));
    });
  }

  void _changeTheme() {
    setState(() {
      _darkTheme = !_darkTheme;
    });
    BlocProvider.of<ThemeBloc>(context)
        .add(ThemeChanged(theme: _darkTheme ? AppTheme.Dark : AppTheme.Light));
  }
}
