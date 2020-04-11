import 'package:san/src/index.dart';
import 'package:san/src/ui/widgets/buttons/raised.dart';
import 'package:san/src/ui/widgets/drawer/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SanRaisedButton(),
          const Text(
            'You have pushed the button this many times:',
          ),
        ],
      ),
    );
  }
}
