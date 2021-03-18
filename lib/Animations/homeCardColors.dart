 import 'package:flutter/cupertino.dart';
import 'dart:math';

colorGenerator(){
  var rng = Random();
  int r = rng.nextInt(255);
  int g = rng.nextInt(255);
  int b = rng.nextInt(255);
  return Color.fromRGBO(r, g, b, 1);
}