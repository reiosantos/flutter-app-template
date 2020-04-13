const String APP_TITLE = 'App Template';

enum ThemeSwitchMode { LIGHT, DARK, SYSTEM }

class ScreenArguments {
  final String title;

  ScreenArguments(this.title);
}

class Routes {
  static const List<String> HOME_ROUTE = ['/home', 'Home'];
  static const List<String> LOGIN_ROUTE = ['/login', 'Login'];
}
