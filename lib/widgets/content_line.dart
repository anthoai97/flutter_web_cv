import 'package:flutter/material.dart';
import 'package:my_cv_web/resource/colors.dart';

import '../resource/styles.dart';

class ContentLineWigdet extends StatelessWidget {
  const ContentLineWigdet({
    Key? key,
    required this.content,
    this.fontSize,
    this.margin,
  }) : super(key: key);

  final String content;
  final double? fontSize;
  final EdgeInsets? margin;

  final TextStyle contentStyle = const TextStyle(
    fontSize: 16,
    color: ColorsDef.slate,
    height: 1.3,
    fontFamily: FontDef.calibre,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.arrow_right,
            color: ColorsDef.kPrimaryColor,
            size: 24,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                content,
                style: fontSize != null
                    ? contentStyle.copyWith(fontSize: fontSize)
                    : contentStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
