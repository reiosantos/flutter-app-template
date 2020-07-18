const String API_KEY = '6576a645e6765a76e8674a75e56';
const String MAIN_IMG =
    'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';

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

const num DAYS_IN_A_YEAR = 356; // average number
const num DAYS_IN_A_MONTH = 30; // average days

const BASE_URL = '';
