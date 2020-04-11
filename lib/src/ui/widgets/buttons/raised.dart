import 'package:san/src/index.dart';

class SanRaisedButton extends StatelessWidget {
  Widget _iosButton() {
    return CupertinoButton(
      onPressed: () {},
      color: Colors.lightBlueAccent,
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: const Text('IOS Button', style: TextStyle(fontSize: 20)),
    );
  }

  Widget _androidButton() {
    return RaisedButton(
      onPressed: () {},
      child: const Text('Android Button', style: TextStyle(fontSize: 20)),
    );
  }

  Widget _webButton() {
    return RaisedButton(
      onPressed: () {},
      child: const Text('Web Button', style: TextStyle(fontSize: 20)),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return _iosButton();
    } else if (Platform.isAndroid) {
      return _androidButton();
    }
    return _webButton();
  }
}
