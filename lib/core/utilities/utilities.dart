import 'package:flutter/material.dart';

class Util {
  // Image
  static Image loadIcon({ required String name }) {
    return Image.asset('assets/icons/$name', gaplessPlayback: true);
  }

  // Font
  static String get fontFamily => 'VarelaRound';
  
  // Color
  static Color color({ required String name }) {
    final buffer = StringBuffer();
    if (name.length == 6 || name.length == 7) {
      buffer.write('ff');
    }
    buffer.write(name.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}