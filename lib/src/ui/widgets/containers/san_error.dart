import 'package:san/src/index.dart';
import 'package:san/src/ui/widgets/buttons/raised.dart';
import 'package:san/src/ui/widgets/containers/san_accented_text.dart';

class SanErrorContainer extends StatelessWidget {
  final String error;
  final Icon icon;
  final VoidCallback refreshHandler;
  SanErrorContainer(this.error, {this.icon, this.refreshHandler});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon ??
              Icon(
                Platform.isIOS ? CupertinoIcons.info : Icons.sync_problem,
                size: 72.0,
                color: Colors.grey.shade600,
              ),
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: SanAccentedText(error),
          ),
          refreshHandler != null
              ? SanRaisedButton('Push to Refresh.', refreshHandler)
              : Container(),
        ],
      ),
    );
  }
}
