import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utilities/utilities.dart';
import 'package:movies/core/widgets/tab_bar_controller/tab_bar_bloc.dart';
import 'package:movies/core/widgets/tab_bar_controller/tab_bar_controller.dart';
import 'package:movies/features/home/account_page.dart';
import 'package:movies/features/home/favorite_page.dart';
import 'package:movies/features/home/home_page.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider<TabBarBloc>(
          create: (context) => TabBarBloc(currentIndex: 0),
          child: _buildTabBarController(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  TabBarController _buildTabBarController() {
    final List<TabBarPage> pages = [
      TabBarPage(
        widget: HomePage(),
        activeIcon: Util.loadIcon(name: 'tab_bar_home_selected.png'),
        inactiveIcon: Util.loadIcon(name: 'tab_bar_home_deselected.png'),
        activeColor: Util.color(name: 'FA2511'),
        inactiveColor: Util.color(name: '12153D'),
        title: 'Home',
      ),
      TabBarPage(
        widget: FavoritePage(),
        activeIcon: Util.loadIcon(name: 'tab_bar_favorite_selected.png'),
        inactiveIcon: Util.loadIcon(name: 'tab_bar_favorite_deselected.png'),
        activeColor: Util.color(name: 'FA2511'),
        inactiveColor: Util.color(name: '12153D'),
        title: 'Favorite',
      ),
      TabBarPage(
        widget: AccountPage(),
        activeIcon: Util.loadIcon(name: 'tab_bar_account_selected.png'),
        inactiveIcon: Util.loadIcon(name: 'tab_bar_account_deselected.png'),
        activeColor: Util.color(name: 'FA2511'),
        inactiveColor: Util.color(name: '12153D'),
        title: 'Account',
      ),
    ];

    return TabBarController(pages: pages);
  }
}
