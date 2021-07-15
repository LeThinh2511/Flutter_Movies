import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/widgets/tab_bar_controller/tab_bar/tab_bar.dart';
import 'package:movies/core/widgets/tab_bar_controller/tab_bar/tab_bar_item.dart';
import 'package:movies/core/widgets/tab_bar_controller/tab_bar_bloc.dart';
import 'package:movies/core/widgets/tab_bar_controller/tab_bar_event.dart';
import 'package:movies/core/widgets/tab_bar_controller/tab_bar_state.dart';

class TabBarController extends StatelessWidget {
  const TabBarController({
    Key? key,
    required this.pages,
  }) : super(key: key);

  final List<TabBarPage> pages;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: _buildPage(),
            ),
            _buildTabBar(context),
          ],
        )));
  }

  AppTabBar _buildTabBar(BuildContext context) {
    return AppTabBar(tabBarItemsData: pages, onPressed: (index) {
      final TabBarBloc bloc = context.read();
      bloc.add(ChangeTabBarEvent(index: index));
    });
  }

  Widget _buildPage() {
    return BlocBuilder<TabBarBloc, TabBarState>(builder: (context, state) {
      if (state is TabBarIndexChange) {
        return pages[state.to].widget;
      } else {
        return const Placeholder();
      }
    });
  }
}

class TabBarPage extends TabBarItemData {
  TabBarPage(
      {required this.widget,
      required Image activeIcon,
      required Image inactiveIcon,
      required Color activeColor,
      required Color inactiveColor,
      required String title})
      : super(
            activeIcon: activeIcon,
            inactiveIcon: inactiveIcon,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            title: title);

  Widget widget;
}
