import 'package:flutter/material.dart';
import 'package:my_cv_web/widgets/custom_animation_container.dart';

import '../../../core/utils/responsive.dart';
import '../../../resource/colors.dart';
import '../../../resource/styles.dart';
import '../../../widgets/section_title.dart';

class Experience extends StatefulWidget {
  const Experience({
    Key? key,
  }) : super(key: key);

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  final GlobalKey _imageKey = GlobalKey();

  final TextStyle contentStyle = const TextStyle(
    fontSize: 20,
    color: ColorsDef.slate,
    height: 1.3,
    fontFamily: FontDef.calibre,
  );

  final double _imageRadius = 8;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      RenderBox? _imageBox =
          _imageKey.currentContext?.findRenderObject() as RenderBox?;
      Size? imageSize = _imageBox?.size;
      if (imageSize != null) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = Responsive.screenHeight(context);
    const double buttonHeight = 42;
    print('build experient');

    return Container(
      constraints: BoxConstraints(minHeight: screenHeight),
      alignment: Alignment.center,
      child: SizedBox(
        width: 900,
        child: CustomAnimationContainer(
          duration: const Duration(milliseconds: 500),
          position: 50,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SectionTitle(indexS: '02.', title: 'Where I\'ve Worked'),
            Container(
              child: Row(
                children: [
                  Container(
                    height: 42 * 5,
                    width: 1.5,
                    color: ColorsDef.kPrimaryColor,
                  ),
                  Column(
                    children: [
                      _buildCompany('HCG'),
                      _buildCompany('Chăn'),
                      _buildCompany('Love'),
                      _buildCompany('An'),
                      _buildCompany('Đúng hông?'),
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget _buildCompany(String name) {
    return InkWell(
      child: Container(
        alignment: Alignment.centerLeft,
        constraints: const BoxConstraints(minWidth: 130),
        height: 42,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Text(
          name,
          style: const TextStyle(
            color: ColorsDef.kPrimaryColor,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
