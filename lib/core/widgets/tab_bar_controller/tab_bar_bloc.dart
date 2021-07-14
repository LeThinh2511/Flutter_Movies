import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/widgets/tab_bar_controller/tab_bar_event.dart';
import 'package:movies/core/widgets/tab_bar_controller/tab_bar_state.dart';

class TabBarBloc extends Bloc<TabBarEvent, TabBarState> {
  TabBarBloc({ required this.currentIndex }) : super(TabBarIndexChange(from: currentIndex, to: currentIndex));

  int currentIndex;

  @override
  Stream<TabBarState> mapEventToState(TabBarEvent event) async* {
    if (event is ChangeTabBarEvent) {
      yield TabBarIndexChange(from: currentIndex, to: event.index);
      currentIndex = event.index;
    }
  }
}

