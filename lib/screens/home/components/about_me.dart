import 'package:flutter/material.dart';
import 'package:my_cv_web/core/utils/utils.dart';
import 'package:my_cv_web/widgets/custom_animation_container.dart';

import '../../../resource/colors.dart';
import '../../../resource/styles.dart';
import '../../../widgets/section_title.dart';

class AboutMeSection extends StatefulWidget {
  const AboutMeSection({
    Key? key,
  }) : super(key: key);

  @override
  State<AboutMeSection> createState() => _AboutMeSectionState();
}

class _AboutMeSectionState extends State<AboutMeSection> {
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
    return CustomAnimationContainer(
      duration: const Duration(milliseconds: 500),
      position: 50,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1000),
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Column(children: [
          const SectionTitle(indexS: '01.', title: 'About Me'),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Hello! My name is Thoai An and",
                          ),
                          TextSpan(
                            text: " coding is my great passion, ",
                            style: contentStyle.copyWith(
                              color: ColorsDef.kPrimaryColor,
                            ),
                          ),
                          const TextSpan(
                            text:
                                "for this reason, I always do my best to enhance myself and live my passion to the fullest. I am confident and fully capable of building an application from the beginning to the final launch on the Store.",
                          )
                        ],
                        style: contentStyle,
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildListContent(
                        "More than 2 years experience on Flutter."),
                    _buildListContent(
                        "Quality experience in creating Flutter multiplatform - web & mobile, plugins , packages and making conversation with native through channels."),
                    _buildListContent(
                        "Proficient in working with Flutter UI and animation."),
                    _buildListContent(
                        "Solid understanding of Clean Architecture, MVP, MVVM, MVC, Design Patterns."),
                    _buildListContent(
                        "Knowledge to unit testing and integration test to create an automation test and control bugs."),
                    _buildListContent(
                        "Work often with integrating payment methods such as Stripe with Card Authentication & 3D Secure, Google Pay and Apple Pay, ..."),
                    _buildListContent(
                        "Good experience working with Git, Version Control."),
                    _buildListContent(
                        "Having UI/UX and material design basic knowledge."),
                    _buildListContent(
                        "Experience to process building an application from the beginning to the final launch on the Store."),
                    _buildListContent(
                        "Communicates well with the team and loves to learn new things."),
                    _buildListContent("Familiar with Agile methodology."),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 60),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 500),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_imageRadius),
                    ),
                    child: ClipRRect(
                      key: _imageKey,
                      borderRadius: BorderRadius.circular(_imageRadius),
                      child: Image.asset(
                        path('images/avatar.jpg'),
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }

  Widget _buildListContent(String content) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.arrow_right,
            color: ColorsDef.kPrimaryColor,
            size: 24,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              content,
              style: contentStyle.copyWith(fontSize: 19),
            ),
          ),
        ],
      ),
    );
  }
}
