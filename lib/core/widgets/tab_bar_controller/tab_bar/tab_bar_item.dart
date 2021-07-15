import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utilities/utilities.dart';
import 'package:movies/core/widgets/tab_bar_controller/tab_bar_bloc.dart';
import 'package:movies/core/widgets/tab_bar_controller/tab_bar_state.dart';

class TabBarItem extends StatelessWidget {
  const TabBarItem({
    Key? key,
    required this.data,
    required this.onPressed,
    required this.index,
  }): super(key: key);

  final TabBarItemData data;
  final void Function() onPressed;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onPressed,
      child: BlocBuilder<TabBarBloc, TabBarState>(
        buildWhen: (_, state) {
          if (state is TabBarIndexChange) {
            return state.from != state.to && (state.from == index || state.to == index);
          }
          return false;
        },
        builder: (_, state) {
          Image icon = data.inactiveIcon;
          Color color = data.inactiveColor;
          if (state is TabBarIndexChange) {
            if (state.to == index) {
              icon = data.activeIcon;
              color = data.activeColor;
            }
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Text(
                data.title,
                style: TextStyle(
                  fontFamily: Util.fontFamily,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: color,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class TabBarItemData {
  const TabBarItemData({
    required this.activeIcon,
    required this.inactiveIcon,
    required this.activeColor,
    required this.inactiveColor,
    required this.title,
  });

  final String title;
  final Image activeIcon;
  final Image inactiveIcon;
  final Color activeColor;
  final Color inactiveColor;
}