import 'package:meta/meta.dart';

@immutable
abstract class BottomNavigationState {}

class InitialBottomNavigationState extends BottomNavigationState {
  final int selectedTab;
  InitialBottomNavigationState({this.selectedTab = 0});
}
