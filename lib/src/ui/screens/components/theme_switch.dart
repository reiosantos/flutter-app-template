import 'package:san/src/blocs/theme/bloc.dart';
import 'package:san/src/index.dart';
import 'package:san/src/utilities/constants.dart';

class ThemeSwitch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ThemeSwitch();
}

class _ThemeSwitch extends State<ThemeSwitch> with WidgetsBindingObserver {
  final GlobalKey _menuKey = GlobalKey();
  ThemeBloc _themeBloc;
  Brightness _brightness;

  ThemeSwitchMode _selectedTheme;
  bool _themeSelected = false;

  List<Map<String, dynamic>> items = [
    <String, dynamic>{
      'text': 'Light',
      'icon': Icons.brightness_5,
      'value': ThemeSwitchMode.LIGHT
    },
    <String, dynamic>{
      'text': 'Dark',
      'icon': Icons.brightness_2,
      'value': ThemeSwitchMode.DARK
    },
    <String, dynamic>{
      'text': 'System',
      'icon': Icons.settings,
      'value': ThemeSwitchMode.SYSTEM
    },
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    setState(() {
      _themeSelected = false;
    });
  }

  void _onSelectTheme(ThemeSwitchMode mode) {
    setState(() {
      _selectedTheme = mode;
    });
    switch (mode) {
      case ThemeSwitchMode.DARK:
        return _themeBloc.add(DarkTheme());
      case ThemeSwitchMode.LIGHT:
        return _themeBloc.add(LightTheme());
      case ThemeSwitchMode.SYSTEM:
        return _themeBloc.add(SystemTheme(_brightness));
      default:
        return _themeBloc.add(LightTheme());
    }
  }

  void _setupTheme() {
    _themeBloc.getOption().then((int value) {
      if (value == null || value == ThemeSwitchMode.SYSTEM.index) {
        _themeBloc.add(SystemTheme(_brightness));
      } else {
        // User already selected the theme, use the current selection
        if (value == ThemeSwitchMode.LIGHT.index) {
          _themeBloc.add(LightTheme());
        } else {
          _themeBloc.add(DarkTheme());
        }
      }

      setState(() {
        if (value == ThemeSwitchMode.LIGHT.index) {
          _selectedTheme = ThemeSwitchMode.LIGHT;
        } else if (value == ThemeSwitchMode.DARK.index) {
          _selectedTheme = ThemeSwitchMode.DARK;
        } else {
          _selectedTheme = ThemeSwitchMode.SYSTEM;
        }
        _themeSelected = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _themeBloc = context.bloc<ThemeBloc>();
    _brightness = MediaQuery.of(context).platformBrightness;

    if (!_themeSelected) {
      _setupTheme();
    }

    Color backgroundColor;
    TextStyle textStyle;

    if (Platform.isIOS) {
      backgroundColor = CupertinoTheme.of(context).barBackgroundColor;
      textStyle = CupertinoTheme.of(context).textTheme.textStyle;
    } else {
      backgroundColor = Theme.of(context).appBarTheme.color;
      textStyle = Theme.of(context).appBarTheme.textTheme.title;
    }

    return GestureDetector(
      onTapDown: (TapDownDetails t) {
        dynamic state = _menuKey.currentState;
        state.showButtonMenu();
      },
      child: PopupMenuButton<ThemeSwitchMode>(
        key: _menuKey,
        elevation: 4,
        initialValue: _selectedTheme,
        padding: EdgeInsets.all(0.0),
        color: backgroundColor,
        tooltip: 'Theme Switch',
        onSelected: _onSelectTheme,
        icon: Icon(Icons.lightbulb_outline, color: textStyle.color),
        itemBuilder: (BuildContext context) {
          return items.map((Map<String, dynamic> item) {
            return PopupMenuItem<ThemeSwitchMode>(
              textStyle: textStyle,
              value: item['value'] as ThemeSwitchMode,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(item['text'] as String),
                  Spacer(),
                  Icon(
                    item['icon'] as IconData,
                    color: textStyle.color,
                    size: textStyle.fontSize,
                  ),
                ],
              ),
            );
          }).toList();
        },
      ),
    );
  }
}
