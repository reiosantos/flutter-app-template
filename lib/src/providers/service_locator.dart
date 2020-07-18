import 'package:get_it/get_it.dart';
import 'package:san/src/providers/navigator_provider.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationProvider());
}
