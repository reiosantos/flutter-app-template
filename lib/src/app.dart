import 'package:san/src/index.dart';
import 'package:san/src/theme/theme.dart';
import 'package:san/src/ui/screens/home.dart';
import 'package:san/src/utilities/constants.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: AppTheme().createTheme(),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
