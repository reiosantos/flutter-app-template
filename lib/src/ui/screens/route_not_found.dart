import 'package:san/src/index.dart';

class RouteNotFound extends StatelessWidget {
  final String name;

  RouteNotFound({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Route for `$name` is not defined'));
  }
}
