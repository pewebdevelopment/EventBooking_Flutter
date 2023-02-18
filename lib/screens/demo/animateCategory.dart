import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class SpringBasedAnimationExample extends StatefulWidget {
  _SpringBasedAnimation createState() => _SpringBasedAnimation();
}
class _SpringBasedAnimation extends State
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  SpringSimulation? _springSimulation;

  @override
  void initState() {
    super.initState();
    _springSimulation = SpringSimulation(
      SpringDescription(
        mass: 1,
        stiffness: 100,
        damping: 1,
      ),
      0.0, // starting point
      300.0, // ending point
      10, // velocity
    );
    _animationController = AnimationController(
      vsync: this,
      upperBound: 500,
    )..addListener(() {
      print(_animationController!.value);
      setState(() {});
    });
    _animationController!.animateWith(_springSimulation!);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(children: [
        Positioned(
          left: 50,
          top: _animationController!.value,
          height: 24.0,
          width: 24.0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.blue,
            ),
          ),
        ),
      ]),
    );
  }
  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }
}