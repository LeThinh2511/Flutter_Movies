import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/widgets/tab_bar_controller/tab_bar/tab_bar_item.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({
    Key? key,
    required this.tabBarItemsData,
    required this.onPressed,
  }) : super(key: key);

  final List<TabBarItemData> tabBarItemsData;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, -6),
          blurRadius: 5,
          spreadRadius: 0,
        )
      ]),
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _buildTabBarItems(),
      ),
    );
  }

  List<TabBarItem> _buildTabBarItems() {
    return List.generate(tabBarItemsData.length, (index) {
      final TabBarItemData data = tabBarItemsData[index];
      return TabBarItem(
        index: index,
        data: data,
        onPressed: () {
          onPressed(index);
        },
      );
    });
  }
}