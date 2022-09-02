import 'package:flutter/material.dart';

getHeight(BuildContext context, double height) {
  return MediaQuery.of(context).size.height * height /100;
}

getWidth(BuildContext context, double width) {
  return MediaQuery.of(context).size.width*width / 100;
}
