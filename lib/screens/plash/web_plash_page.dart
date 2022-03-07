import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';

import '../../resource/colors.dart';

class WebPlashPage extends StatefulWidget {
  const WebPlashPage({
    Key? key,
    required this.onCompleteAnimation,
  }) : super(key: key);

  final Function onCompleteAnimation;

  @override
  State<WebPlashPage> createState() => _WebPlashPageState();
}

class _WebPlashPageState extends State<WebPlashPage>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _fadeTransitionController;
  late AnimationController _scaleTransitionController;
  final Tween<double> _logoAnimationTween = Tween(begin: 0, end: 1);

  @override
  void initState() {
    super.initState();
    _rotationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _fadeTransitionController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));

    _scaleTransitionController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _rotationController.forward();
    _rotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _fadeTransitionController.forward();
      }
    });

    _fadeTransitionController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _scaleTransitionController.forward();
      }
    });

    _scaleTransitionController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onCompleteAnimation();
      }
    });
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _fadeTransitionController.dispose();
    _scaleTransitionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale:
          Tween<double>(begin: 1, end: 0).animate(_scaleTransitionController),
      child: Center(
        child: RotationTransition(
          turns: _logoAnimationTween.animate(_rotationController),
          alignment: Alignment.center,
          child: Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(18.0),
            decoration: const ShapeDecoration(
              shape: PolygonBorder(
                sides: 6,
                rotate: 0,
                side: BorderSide(
                  color: ColorsDef.kPrimaryColor,
                  width: 4,
                ),
              ),
            ),
            alignment: Alignment.center,
            child: FadeTransition(
              opacity: _logoAnimationTween.animate(_fadeTransitionController),
              child: const Text(
                'A',
                style: TextStyle(
                  fontSize: 45,
                  color: ColorsDef.kPrimaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
