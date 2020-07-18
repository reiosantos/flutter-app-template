import 'package:san/src/index.dart';

import './bloc.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  final BottomNavigationState initialState;

  BottomNavigationBloc({this.initialState})
      : super(initialState ?? InitialBottomNavigationState());

  @override
  Stream<BottomNavigationState> mapEventToState(
    BottomNavigationEvent event,
  ) async* {
    if (event is BottomNavigationEventImpl) {
      yield InitialBottomNavigationState(selectedTab: event.selectedTab);
    }
  }
}
