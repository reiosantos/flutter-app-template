import 'package:san/src/index.dart';
import 'package:san/src/utilities/constants.dart';

class PlatformWrapper extends StatelessWidget {
  const PlatformWrapper({@required this.page});

  final Widget page;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as ScreenArguments;

    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(args.title),
        ),
        child: page,
      );
    }

    // this assumes android
    return Scaffold(
      primary: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Center(child: Text(args.title)),
      ),
      body: page,
    );
  }
}
