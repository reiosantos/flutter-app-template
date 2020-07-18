import 'package:san/src/index.dart';
import 'package:san/src/theme/colors.dart';

class SanAccentedText extends StatelessWidget {
  final String message;
  SanAccentedText(this.message);

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    if (Platform.isIOS) {
      brightness = CupertinoTheme.brightnessOf(context);
    }

    return Text(
      message,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: brightness == Brightness.dark
            ? SanColors.accentColor.shade500
            : Colors.grey.shade700,
      ),
    );
  }
}
