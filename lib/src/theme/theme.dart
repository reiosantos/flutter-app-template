import 'package:san/src/index.dart';
import 'package:san/src/theme/colors.dart';

class AppTheme extends SanColors {
  bool iosOverrideMaterialTheme = true;

  Diagnosticable _createTheme() {
    var theme = ThemeData();

    return ThemeData(
      primarySwatch: SanColors.primaryColor,
      accentColor: SanColors.accent,
      scaffoldBackgroundColor: SanColors.lightBackground,
      appBarTheme: theme.appBarTheme.copyWith(
        elevation: 0,
        textTheme: theme.textTheme,
      ),
      textTheme: theme.textTheme.copyWith(
        title: theme.textTheme.title.copyWith(
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

    base = base.copyWith(
      brightness: brightness,
      backgroundColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: base.appBarTheme.copyWith(
        color: backgroundColor,
        textTheme: base.appBarTheme.textTheme.copyWith(
          title: base.appBarTheme.textTheme.title.copyWith(
            color: textColor,
          ),
          body1: base.appBarTheme.textTheme.body1.copyWith(
            color: textColor,
          ),
        ),
        actionsIconTheme: base.accentIconTheme.copyWith(
          color: textColor,
        ),
        iconTheme: base.iconTheme.copyWith(
          color: textColor,
        ),
      ),
      textTheme: base.textTheme.copyWith(
        title: base.textTheme.title.copyWith(
          color: textColor,
        ),
        body1: base.textTheme.body1.copyWith(
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

    if (Platform.isIOS) {
      var base1 = CupertinoThemeData();
      base1 = base1.copyWith(
        primaryColor: SanColors.primaryColor,
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
