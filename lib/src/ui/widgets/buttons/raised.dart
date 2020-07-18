import 'package:san/src/index.dart';

class SanRaisedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  SanRaisedButton(this.text, this.onPressed);

  Widget _iosButton(BuildContext context) {
    var textStyle = CupertinoTheme.of(context).textTheme.textStyle;

    return CupertinoButton(
      onPressed: onPressed,
      color: CupertinoTheme.of(context).primaryContrastingColor.withOpacity(.7),
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: Text(text, style: textStyle),
    );
  }

  Widget _androidButton(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.bodyText2;

    return RaisedButton(
      onPressed: onPressed,
      color: Theme.of(context).accentColor.withOpacity(.7),
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: Text(text, style: textStyle),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return _iosButton(context);
    }
    return _androidButton(context);
  }
}
