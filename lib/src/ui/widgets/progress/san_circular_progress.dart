import 'package:san/src/index.dart';

class SanCircularProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? CircularProgressIndicator(strokeWidth: 2.0)
        : CircularProgressIndicator(
            strokeWidth: 2.0,
            valueColor: AlwaysStoppedAnimation<Color>(
                CupertinoTheme.of(context).primaryContrastingColor),
          );
  }
}
