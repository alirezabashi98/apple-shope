import 'dart:ui';

Color hexColor(String color) {
  String categoryColor = color.toUpperCase().replaceAll("#", "");
  if (color.length == 6) categoryColor = 'FF$categoryColor';
  int hexColorInt = int.parse(categoryColor, radix: 16);


  return Color(hexColorInt);
}
