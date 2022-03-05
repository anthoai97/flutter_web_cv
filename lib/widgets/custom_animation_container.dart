import 'package:flutter/material.dart';

enum CustomTranslateType { up, down }

class CustomAnimationContainer extends StatefulWidget {
  const CustomAnimationContainer({
    Key? key,
    required this.child,
    this.type = CustomTranslateType.up,
    this.position = 15,
    this.duration = const Duration(milliseconds: 300),
    this.delayDuration = const Duration(milliseconds: 0),
  }) : super(key: key);

  final Widget child;
  final CustomTranslateType type;
  final double position;
  final Duration duration;
  final Duration delayDuration;

  @override
  _CustomAnimationContainerState createState() =>
      _CustomAnimationContainerState();
}

class _CustomAnimationContainerState extends State<CustomAnimationContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _opacity;
  late Animation<double> _translate;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _opacity = Tween<double>(begin: 0, end: 1).animate(_controller);
    _translate = Tween<double>(
            begin: widget.type == CustomTranslateType.down
                ? -widget.position
                : widget.position,
            end: 0)
        .animate(_controller);

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Future.delayed(widget.delayDuration);
      await _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Transform.translate(
      offset: Offset(0, _translate.value),
      child: Opacity(
        opacity: _opacity.value,
        child: widget.child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: _buildAnimation,
    );
  }
}
