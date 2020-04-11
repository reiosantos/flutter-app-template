import 'package:san/src/index.dart';
import 'package:san/src/ui/screens/home.dart';
import 'package:san/src/ui/screens/notifications.dart';
import 'package:san/src/ui/screens/people.dart';
import 'package:san/src/ui/screens/settings.dart';
import 'package:san/src/ui/screens/user.dart';
import 'package:san/src/ui/screens/videos.dart';
import 'package:san/src/utilities/constants.dart';

// ignore: must_be_immutable
class SanTabController extends StatefulWidget {
  SanTabController({Key key}) : super(key: key);

  int _selectedPage = 0;

  @override
  State<StatefulWidget> createState() => _SanTabController();
}

class _SanTabController extends State<SanTabController> {
  final List<BottomNavigationBarItem> tabs = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Container()),
    BottomNavigationBarItem(icon: Icon(Icons.people), title: Container()),
    BottomNavigationBarItem(
        icon: Icon(Icons.video_library), title: Container()),
    BottomNavigationBarItem(
        icon: Icon(Icons.notifications), title: Container()),
    BottomNavigationBarItem(icon: Icon(Icons.person), title: Container()),
    BottomNavigationBarItem(icon: Icon(Icons.menu), title: Container()),
  ];

  final List<Widget> items = <Widget>[
    HomePage(),
    PeoplePage(),
    VideoPage(),
    NotificationPage(),
    UserPage(),
    SettingPage()
  ];

  Widget _ios() {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: tabs,
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context1) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text(APP_TITLE),
              ),
              child: items[index],
            );
          },
        );
      },
    );
  }

  Widget _android() {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        primary: true,
        resizeToAvoidBottomInset: false,
        body: Scaffold(
          appBar: AppBar(
            title: Center(child: Text(APP_TITLE)),
          ),
          body: items[widget._selectedPage],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: widget._selectedPage,
            onTap: (int index) {
              setState(() {
                widget._selectedPage = index;
              });
            },
            items: tabs,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return _ios();
    }
    return _android();
  }
}
