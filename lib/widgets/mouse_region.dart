import 'package:flutter/material.dart';

class CustomMouseRegion extends StatefulWidget {
  const CustomMouseRegion({Key? key, required this.child, this.onHoverCallback})
      : super(key: key);

  final Widget child;
  final Function(bool)? onHoverCallback;

  @override
  State<CustomMouseRegion> createState() => _CustomMouseRegionState();
}

class _CustomMouseRegionState extends State<CustomMouseRegion> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (_) {
        widget.onHoverCallback?.call(true);
      },
      onExit: (_) {
        widget.onHoverCallback?.call(false);
      },
      child: widget.child,
    );
  }
}
