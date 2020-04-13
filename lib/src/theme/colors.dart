import 'package:san/src/index.dart';

abstract class SanColors {
  static const int _primaryLight = 0xFFC2C2C2;
  static const int _primary = 0xFF333333; // rgb(51,51,51)
  static const int _primaryDark = 0xFF202020;

  static const int _accentLight = 0xFFFFECB5;
  static const int _accent = 0xFFFFC107; // rgb(255,193,7)
  static const int _accentDark = 0xFFFFAB04;

  static const int _warningLight = 0xFFFFB3B3;
  static const int _warning = 0xFFFF0000;
  static const int _warningDark = 0xFFFF0000;

  static const int _lightThemeText = 0xFF000000;
  static const int _lightThemeBackground = 0xFFFAFAFA;

  static const int _darkThemeText = 0xFFFFFFFF;
  static const int _darkThemeBackground = 0xFF2C2C2C;

  static const int _primaryText = 0xFF212121;
  static const int _primaryDivider = 0xFF212121;
  static const int _primaryAccent = 0xFFFFEB3B;
  static const int _secondaryText = 0xFF757575;

  static final MaterialColor primaryColor =
      MaterialColor(_primary, getPrimarySwatch());

  static final MaterialColor accentColor =
      MaterialColor(_accent, getAccentSwatch());

  static final Color primary = primaryColor.shade500;
  static final Color primaryLight = primaryColor.shade500;
  static final Color accent = accentColor.shade500;
  static final Color lightText = Color(_lightThemeText);
  static final Color lightBackground = Color(_lightThemeBackground);
  static final Color darkText = Color(_darkThemeText);
  static final Color darkBackground = Color(_darkThemeBackground);

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

  static Map<int, Color> getAccentSwatch() {
    return const <int, Color>{
      50: Color.fromRGBO(255, 193, 7, .1),
      100: Color.fromRGBO(255, 193, 7, .2),
      200: Color.fromRGBO(255, 193, 7, .3),
      300: Color.fromRGBO(255, 193, 7, .4),
      400: Color.fromRGBO(255, 193, 7, .5),
      500: Color.fromRGBO(255, 193, 7, .6),
      600: Color.fromRGBO(255, 193, 7, .7),
      700: Color.fromRGBO(255, 193, 7, .8),
      800: Color.fromRGBO(255, 193, 7, .9),
      900: Color.fromRGBO(255, 193, 7, 1)
    };
  }

  Diagnosticable lightTheme();
  Diagnosticable darkTheme();
}
