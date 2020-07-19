import 'package:san/src/index.dart';
import 'package:san/src/ui/widgets/buttons/raised.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  void _onPressed() {
    print('I am clicked');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SanRaisedButton('Press Me', _onPressed),
          const Text(
            'You have pushed the button this many times:',
          ),
        ],
      ),
    );
  }
}
