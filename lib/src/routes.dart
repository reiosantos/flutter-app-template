import 'package:san/src/index.dart';
import 'package:san/src/ui/screens/components/platform_wrapper.dart';
import 'package:san/src/ui/screens/pages/home/home.dart';
import 'package:san/src/ui/screens/pages/route_not_found.dart';
import 'package:san/src/utilities/constants.dart';

Widget _wrapper(Widget page) {
  return PlatformWrapper(
    page: page,
  );
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    default:
      if (Platform.isIOS) {
        return CupertinoPageRoute<dynamic>(
          builder: (BuildContext context) =>
              _wrapper(RouteNotFound(name: settings.name)),
        );
      }
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) =>
            _wrapper(RouteNotFound(name: settings.name)),
      );
  }
}

// Add app DYNAMIC routes here
Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  Routes.HOME_ROUTE[0]: (BuildContext context) => _wrapper(HomePage()),
};
