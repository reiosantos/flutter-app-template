import 'package:san/src/blocs/theme/bloc.dart';
import 'package:san/src/index.dart';
import 'package:san/src/providers/navigator_provider.dart';
import 'package:san/src/providers/service_locator.dart';
import 'package:san/src/ui/screens/containers/tab_controller.dart';
import 'package:san/src/utilities/constants.dart';

import 'routes.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.

  Widget _iosApp(ChangeThemeState state) {
    return CupertinoApp(
      title: APP_TITLE,
      theme: state.themeData as CupertinoThemeData,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      routes: routes,
      navigatorKey: locator<NavigationProvider>().navigatorKey,
      onGenerateRoute: onGenerateRoute,
      home: SanTabController(),
    );
  }

  Widget _androidApp(ChangeThemeState state) {
    return MaterialApp(
      title: APP_TITLE,
      theme: state.themeData as ThemeData,
      debugShowCheckedModeBanner: false,
      routes: routes,
      navigatorKey: locator<NavigationProvider>().navigatorKey,
      onGenerateRoute: onGenerateRoute,
      home: SanTabController(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context1) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return Material(
            child: (() {
              if (Platform.isIOS) {
                return _iosApp(state as ChangeThemeState);
              }
              return _androidApp(state as ChangeThemeState);
            })(),
          );
        },
      ),
    );
  }
}
