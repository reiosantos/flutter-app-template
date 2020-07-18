import 'package:san/src/index.dart';
import 'package:san/src/ui/widgets/containers/san_accented_text.dart';
import 'package:san/src/ui/widgets/progress/san_circular_progress.dart';

class SanLoadingContainer extends StatelessWidget {
  final String message;
  SanLoadingContainer({this.message = 'Loading...'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: SanAccentedText(message),
          ),
          SanCircularProgress(),
        ],
      ),
    );
  }
}
