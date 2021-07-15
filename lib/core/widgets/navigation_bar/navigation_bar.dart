import 'package:flutter/material.dart';
import 'package:movies/core/utilities/utilities.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    Key? key,
    this.title,
    this.onPressedBack,
    this.leftWidget,
    this.titleWidget,
    this.rightWidget,
  }) : super(key: key);

  final String? title;

  final void Function()? onPressedBack;

  final Widget? leftWidget;
  final Widget? titleWidget;
  final Widget? rightWidget;

  Widget setupContent({ required Widget child, Color backgroundColor = Colors.white }) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            this,
            Expanded(child: child),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 5),
          blurRadius: 4,
          spreadRadius: 0,
        )
      ]),
      height: 44,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Row(
            children: [
              _buildLeftComponents(),
              Expanded(child: Container()),
              _buildRightComponents(),
            ],
          ),
          _buildTitleComponents()
        ],
      ),
    );
  }

  Widget _buildLeftComponents() {
    if (onPressedBack != null) {
      final Widget backButton = IconButton(
          onPressed: onPressedBack,
          icon: Util.loadIcon(name: 'navigate_back.png'));

      if (leftWidget != null) {
        return Row(
          children: [backButton, leftWidget!],
        );
      } else {
        return backButton;
      }
    } else {
      if (leftWidget != null) {
        return leftWidget!;
      } else {
        return Container();
      }
    }
  }

  Widget _buildTitleComponents() {
    if (titleWidget != null) {
      return titleWidget!;
    } else if (title != null) {
      return Text(
        title!,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: Util.fontFamily,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildRightComponents() {
    if (rightWidget != null) {
      return rightWidget!;
    } else {
      return Container();
    }
  }
}