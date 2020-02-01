import 'package:san/src/index.dart';

mixin SanColors {
  static const int _primary = 0xFF333333; // rgb(51,51,51)
  static const int _secondary = 0xFFFFC400; // rgb(255,196,0)

  static final MaterialColor primaryColor =
      MaterialColor(_primary, getPrimarySwatch());

  static final MaterialColor _secondaryColor =
      MaterialColor(_secondary, getSecondarySwatch());

  static const Color sanRed = Colors.red;
  static const Color sanErrorRed = Colors.red;

  static const Color sanWhite = Colors.white;
  static const Color sanBackgroundWhite = Colors.white70;

  static const Color sanGray = Colors.grey;
  static final Color sanGray50 = Colors.grey.shade50;

  static const Color sanPrimary = Color(_primary);
  static final Color sanPrimaryDark = primaryColor.shade700;

  static const Color sanSecondary = Color(_secondary);
  static final Color sanSecondaryDark = _secondaryColor.shade700;

  static const Color sanTextColor = Colors.white;

  static Map<int, Color> getPrimarySwatch() {
    return const <int, Color>{
      50: Color.fromRGBO(51, 51, 51, .1),
      100: Color.fromRGBO(51, 51, 51, .2),
      200: Color.fromRGBO(51, 51, 51, .3),
      300: Color.fromRGBO(51, 51, 51, .4),
      400: Color.fromRGBO(51, 51, 51, .5),
      500: Color.fromRGBO(51, 51, 51, .6),
      600: Color.fromRGBO(51, 51, 51, .7),
      700: Color.fromRGBO(51, 51, 51, .8),
      800: Color.fromRGBO(51, 51, 51, .9),
      900: Color.fromRGBO(51, 51, 51, 1)
    };
  }

  static Map<int, Color> getSecondarySwatch() {
    return const <int, Color>{
      50: Color.fromRGBO(255, 196, 0, .1),
      100: Color.fromRGBO(255, 196, 0, .2),
      200: Color.fromRGBO(255, 196, 0, .3),
      300: Color.fromRGBO(255, 196, 0, .4),
      400: Color.fromRGBO(255, 196, 0, .5),
      500: Color.fromRGBO(255, 196, 0, .6),
      600: Color.fromRGBO(255, 196, 0, .7),
      700: Color.fromRGBO(255, 196, 0, .8),
      800: Color.fromRGBO(255, 196, 0, .9),
      900: Color.fromRGBO(255, 196, 0, 1)
    };
  }

  ThemeData createTheme();
}
