class ApiConfig {
  static const String API_KEY = 'afc072076fd42b05abd1431a0f45c601';
  static const String BASE_API_URL = 'https://api.themoviedb.org/3';
  static const String BASE_POSTER_URL = 'https://image.tmdb.org/t/p/w342';

  static ApiConfig _instance;

  ApiConfig._();

  static ApiConfig get instance {
    if (_instance == null) {
      _instance = ApiConfig._();
    }
    return _instance;
  }
}
