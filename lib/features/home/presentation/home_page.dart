import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/utilities/utilities.dart';
import 'package:movies/core/widgets/navigation_bar/navigation_bar.dart';
import 'package:movies/features/home/presentation/widgets/category_list.dart';
import 'package:movies/features/home/presentation/widgets/genre_list.dart';
import 'package:movies/features/home/presentation/widgets/home_movie_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildNavigationBar().setupContent(
        child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CategoryList(),
            GenreList(),
            HomeMovieList(),
          ],
      ),
    ));
  }

  NavigationBar _buildNavigationBar() {
    return NavigationBar(
      title: 'Home',
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
