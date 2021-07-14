import 'package:flutter/material.dart';
import 'package:movies/core/utilities/utilities.dart';
import 'package:movies/core/widgets/navigation_bar/navigation_bar.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildNavigationBar(),
    );
  }

  NavigationBar _buildNavigationBar() {
    return NavigationBar(
      title: 'Account',
      leftWidget: IconButton(
        icon: Util.loadIcon(name: 'menu.png'),
        onPressed: () {
          print('menu');
        },
      ),
      rightWidget: IconButton(
        icon: Util.loadIcon(name: 'search.png'),
        onPressed: () {
          print('search');
        },
      ),
    );
  }
}