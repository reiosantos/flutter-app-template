import 'package:san/src/index.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('VIDEO PAGE'),
        ],
      ),
    );
  }
}
