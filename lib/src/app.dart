import 'package:san/src/index.dart';
import 'package:san/src/routes.dart';
import 'package:san/src/theme/theme.dart';
import 'package:san/src/utilities/constants.dart';

import 'routes.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: AppTheme().createTheme(),
      routes: routes,
      onGenerateRoute: onGenerateRoute,
      initialRoute: Routes.HOME_ROUTE,
    );
  }
}
