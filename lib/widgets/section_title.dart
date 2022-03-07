import 'package:flutter/material.dart';
import 'package:my_cv_web/resource/styles.dart';

import '../resource/colors.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.indexS,
    required this.title,
  }) : super(key: key);

  final String indexS;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            indexS,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: ColorsDef.kPrimaryColor,
              fontSize: 20,
            ),
          ),
          const SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.only(top: 8),
            alignment: Alignment.center,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: ColorsDef.lightestSlate,
                fontFamily: FontDef.calibre,
                fontSize: 32,
                height: 1.1,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            width: 300,
            height: 1,
            color: ColorsDef.lightestNavy,
          )
        ],
      ),
    );
  }
}
