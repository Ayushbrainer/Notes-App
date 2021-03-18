import 'package:flutter/material.dart';
import 'dart:math';

class animated_Image extends StatelessWidget {

  const animated_Image({
    @required this.angle,
    @required this.child
  });

  final Widget child;
  final Animation<double> angle;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: angle, builder: (context,child){
      return SizeTransition(
        sizeFactor:angle,
        child: child,
      );
    },
      child: child,);
  }
}