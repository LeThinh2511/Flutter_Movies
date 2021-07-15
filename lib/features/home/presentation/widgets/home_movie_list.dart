import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movies/core/utilities/utilities.dart';

class HomeMovieList extends StatefulWidget {
  @override
  _HomeMovieListState createState() => _HomeMovieListState();
}

class _HomeMovieListState extends State<HomeMovieList> {
  int selectedGenre = 0;
  List<String> genres = [
    'Action',
    'Crime',
    'Comedy',
    'Drama',
    'Horror',
    'Animation',
    'Crime',
    'Comedy',
    'Drama',
    'Horror',
    'Crime',
    'Comedy',
    'Drama',
    'Horror',
  ];

  List<Color> colors = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.black,
    Colors.blue,
    Colors.purple,
    Colors.deepOrange
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) => buildGenre(index, context),
      ),
    );
  }

  Padding buildGenre(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedGenre = index;
          });
        },
        child: Container(
          width: 250,
          decoration: BoxDecoration(
              color: colors[Random().nextInt(6)],
              border: Border.all(color: Util.color(name: '12153D'), width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(50))),
        ),
      ),
    );
  }
}
