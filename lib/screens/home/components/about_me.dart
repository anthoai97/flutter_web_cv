import 'package:flutter/material.dart';
import 'package:my_cv_web/core/utils/responsive.dart';
import 'package:my_cv_web/core/utils/utils.dart';
import 'package:my_cv_web/widgets/content_line.dart';
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
    fontSize: 18,
    color: ColorsDef.slate,
    height: 1.3,
    fontFamily: FontDef.calibre,
  );

  final double _imageRadius = 8;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = Responsive.screenHeight(context);

    return Container(
      constraints: BoxConstraints(minHeight: screenHeight),
      child: CustomAnimationContainer(
        duration: const Duration(milliseconds: 500),
        position: 80,
        child: Container(
          alignment: Alignment.center,
          child: SizedBox(
            width: 1000,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                          const ContentLineWigdet(
                              fontSize: 18,
                              content:
                                  "More than 2 years experience on Flutter."),
                          const ContentLineWigdet(
                              fontSize: 18,
                              content:
                                  "Quality experience in creating Flutter multiplatform - web & mobile, plugins , packages and making conversation with native through channels."),
                          const ContentLineWigdet(
                              fontSize: 18,
                              content:
                                  "Proficient in working with Flutter UI and animation."),
                          const ContentLineWigdet(
                              fontSize: 18,
                              content:
                                  "Solid understanding of Clean Architecture, MVP, MVVM, MVC, Design Patterns."),
                          const ContentLineWigdet(
                              fontSize: 18,
                              content:
                                  "Knowledge to unit testing and integration test to create an automation test and control bugs."),
                          const ContentLineWigdet(
                              fontSize: 18,
                              content:
                                  "Work often with integrating payment methods such as Stripe with Card Authentication & 3D Secure, Google Pay and Apple Pay, ..."),
                          const ContentLineWigdet(
                              fontSize: 18,
                              content:
                                  "Good experience working with Git, Version Control."),
                          const ContentLineWigdet(
                              fontSize: 18,
                              content:
                                  "Having UI/UX and material design basic knowledge."),
                          const ContentLineWigdet(
                              fontSize: 18,
                              content:
                                  "Experience to process building an application from the beginning to the final launch on the Store."),
                          const ContentLineWigdet(
                              fontSize: 18,
                              content:
                                  "Communicates well with the team and loves to learn new things."),
                          const ContentLineWigdet(
                              fontSize: 18,
                              content: "Familiar with Agile methodology."),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
