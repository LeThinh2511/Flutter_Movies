import 'package:flutter/material.dart';
import 'package:movies/core/utilities/utilities.dart';

class GenreList extends StatefulWidget {
  @override
  _GenreListState createState() => _GenreListState();
}

class _GenreListState extends State<GenreList> {
  int selectedGenre = 0;
  List<String> genres = [
    'Action',
    'Crime',
    'Comedy',
    'Drama',
    'Horror',
    'Animation'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 32),
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) => buildGenre(index, context),
      ),
    );
  }

  Padding buildGenre(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedGenre = index;
          });
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Align(
              child: Text(
                genres[index],
                style: TextStyle(
                    color: selectedGenre == index
                        ? Colors.white
                        : Util.color(name: '12153D')),
              ),
            ),
          ),
          decoration: BoxDecoration(
              color: index == selectedGenre
                  ? Util.color(name: '12153D')
                  : Colors.white,
              border: Border.all(color: Util.color(name: '12153D'), width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(50))),
        ),
      ),
    );
  }
}
