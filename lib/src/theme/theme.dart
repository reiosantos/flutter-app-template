import 'package:san/src/index.dart';
import 'package:san/src/theme/colors.dart';

class AppTheme extends SanColors {
  bool iosOverrideMaterialTheme = true;

  Diagnosticable _createTheme() {
    var theme = ThemeData();

    return ThemeData(
      primarySwatch: SanColors.primaryColor,
      accentColor: SanColors.accentColor,
      scaffoldBackgroundColor: SanColors.lightBackground,
      iconTheme: theme.iconTheme,
      appBarTheme: theme.appBarTheme.copyWith(
        elevation: 0,
        textTheme: theme.textTheme,
        iconTheme: theme.iconTheme,
      ),
      textTheme: theme.textTheme.copyWith(
        headline6: theme.textTheme.headline6.copyWith(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      accentIconTheme: theme.accentIconTheme.copyWith(
        color: SanColors.accentColor.shade900,
      ),
    );
  }

  Diagnosticable _theme(
      Color backgroundColor, Color textColor, Brightness brightness) {
    var base = (_createTheme() as ThemeData);

    var isLight = brightness == Brightness.light;

    base = base.copyWith(
      brightness: brightness,
      backgroundColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor,
      dialogBackgroundColor: backgroundColor,
      iconTheme: base.iconTheme.copyWith(
        color: textColor,
      ),
      appBarTheme: base.appBarTheme.copyWith(
        color: backgroundColor,
        brightness: brightness,
        textTheme: base.appBarTheme.textTheme.copyWith(
          headline6: base.appBarTheme.textTheme.headline6.copyWith(
            color: textColor,
          ),
          bodyText2: base.appBarTheme.textTheme.bodyText2.copyWith(
            color: textColor,
          ),
          button: base.appBarTheme.textTheme.button.copyWith(
            color: textColor,
          ),
        ),
        actionsIconTheme: base.accentIconTheme.copyWith(
          color: textColor,
        ),
        iconTheme: base.appBarTheme.iconTheme.copyWith(
          color: textColor,
        ),
      ),
      textTheme: base.textTheme.copyWith(
        headline6: base.textTheme.headline6.copyWith(
          color: textColor,
        ),
        bodyText2: base.textTheme.bodyText2.copyWith(
          color: textColor,
        ),
        button: base.textTheme.button.copyWith(
          color: textColor,
        ),
      ),
      popupMenuTheme: base.popupMenuTheme.copyWith(
        color: textColor,
        elevation: 2,
      ),
      cardTheme: base.cardTheme.copyWith(
        color: backgroundColor,
        elevation: 2,
      ),
    );

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: base.appBarTheme.color,
      systemNavigationBarColor: base.appBarTheme.color,
      systemNavigationBarIconBrightness:
          isLight ? Brightness.dark : Brightness.light,
    ));

    if (Platform.isIOS) {
      var base1 = CupertinoThemeData();
      base1 = base1.copyWith(
        primaryColor: SanColors.primaryColor,
        primaryContrastingColor: SanColors.accentColor,
        barBackgroundColor: backgroundColor,
        scaffoldBackgroundColor: backgroundColor,
        brightness: brightness,
        textTheme: base1.textTheme.copyWith(
          primaryColor: textColor,
          textStyle: base1.textTheme.textStyle.copyWith(
            color: textColor,
          ),
        ),
      );

      var base2 = base;
      if (iosOverrideMaterialTheme) {
        base2 = base.copyWith(cupertinoOverrideTheme: base1);
      }
      return MaterialBasedCupertinoThemeData(materialTheme: base2);
    }
    return base;
  }

  @override
  Diagnosticable lightTheme() {
    return _theme(
      SanColors.lightBackground,
      SanColors.lightText,
      Brightness.light,
    );
  }

  @override
  Diagnosticable darkTheme() {
    return _theme(
      SanColors.darkBackground,
      SanColors.darkText,
      Brightness.dark,
    );
  }
}
