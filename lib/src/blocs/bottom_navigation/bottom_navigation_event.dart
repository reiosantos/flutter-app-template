import 'package:san/src/index.dart';

@immutable
abstract class BottomNavigationEvent {}

class BottomNavigationEventImpl extends BottomNavigationEvent {
  final int selectedTab;
  BottomNavigationEventImpl(this.selectedTab);

  @override
  String toString() => 'Bottom Navigation Impl';
}
