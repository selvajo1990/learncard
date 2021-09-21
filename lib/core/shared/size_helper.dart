import 'package:flutter/material.dart';

Size displaySize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double getScreenHeight(BuildContext context) {
  return displaySize(context).height;
}

double getScreenWidth(BuildContext context) {
  return displaySize(context).width;
}
