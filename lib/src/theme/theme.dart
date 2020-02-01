import 'package:san/src/index.dart';
import 'package:san/src/theme/colors.dart';

class AppTheme extends SanColors {
  @override
  ThemeData createTheme() {
    final base = ThemeData(
        primarySwatch: SanColors.primaryColor,
        primaryColor: SanColors.sanPrimary,
        primaryColorDark: SanColors.sanPrimaryDark,
        canvasColor: SanColors.sanPrimary,
        accentColor: SanColors.sanSecondary,
        backgroundColor: SanColors.sanPrimaryDark);

    return base.copyWith(
      buttonTheme: base.buttonTheme.copyWith(
        textTheme: ButtonTextTheme.normal,
      ),
      textTheme: base.textTheme.copyWith(
          body1: base.textTheme.body1.copyWith(color: SanColors.sanTextColor)),
      textSelectionColor: SanColors.sanGray50,
      errorColor: SanColors.sanErrorRed,
    );
  }
}
