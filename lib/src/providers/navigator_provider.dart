import 'package:san/src/index.dart';
import 'package:san/src/utilities/constants.dart';

class NavigationProvider {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {ScreenArguments args}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: args);
  }
}
