import 'package:san/src/index.dart';

@immutable
abstract class ThemeEvent {}

class SystemTheme extends ThemeEvent {
  final Brightness brightness;

  SystemTheme(this.brightness);

  @override
  String toString() => 'System Theme';
}

class LightTheme extends ThemeEvent {
  @override
  String toString() => 'Light Theme';
}

class DarkTheme extends ThemeEvent {
  @override
  String toString() => 'Dark Theme';
}
