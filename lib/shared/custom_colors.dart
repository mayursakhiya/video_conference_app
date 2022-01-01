import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final Color primaryColor = Colors.white;
final Color accentColor = Colors.blue;

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

List<Color> gradientColors() {
  final colors = [fromHex("BED3DCFF"), fromHex("CBEAF8FF")];
  colors.shuffle();
  return colors;
}
