import 'package:san/src/index.dart';
import 'package:san/src/ui/screens/home.dart';
import 'package:san/src/ui/screens/route_not_found.dart';
import 'package:san/src/utilities/constants.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    default:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => RouteNotFound(name: settings.name),
      );
  }
}

// Add app DYNAMIC routes here
Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  Routes.HOME_ROUTE: (BuildContext context) =>
      const HomePage(title: 'Flutter Demo Home Page'),
};
