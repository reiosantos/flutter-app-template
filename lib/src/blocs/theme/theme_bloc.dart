import 'package:san/src/index.dart';
import 'package:san/src/utilities/constants.dart';

import './theme_event.dart';
import './theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeState initialState;

  ThemeBloc({this.initialState})
      : super(initialState ?? ChangeThemeState.lightTheme());

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is LightTheme) {
      yield ChangeThemeState.lightTheme();

      try {
        await _saveOptionValue(ThemeSwitchMode.LIGHT.index);
      } catch (_) {
        throw Exception('Could not persist light theme change');
      }
    }

    if (event is DarkTheme) {
      yield ChangeThemeState.darkTheme();

      try {
        await _saveOptionValue(ThemeSwitchMode.DARK.index);
      } catch (_) {
        throw Exception('Could not persist dark theme change');
      }
    }

    if (event is SystemTheme) {
      if (event.brightness == Brightness.dark) {
        yield ChangeThemeState.darkTheme();
      } else {
        yield ChangeThemeState.lightTheme();
      }

      try {
        await _saveOptionValue(ThemeSwitchMode.SYSTEM.index);
      } catch (_) {
        throw Exception('Could not persist system theme change');
      }
    }
  }

  Future<void> _saveOptionValue(int optionValue) async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.setInt('theme_option', optionValue);
  }

  Future<int> getOption() async {
    var preferences = await SharedPreferences.getInstance();
    return preferences.get('theme_option') as int;
  }
}
