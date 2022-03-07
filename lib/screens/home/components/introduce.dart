import 'package:flutter/material.dart';
import 'package:my_cv_web/core/utils/utils.dart';
import 'package:my_cv_web/widgets/custom_animation_container.dart';

import '../../../core/utils/responsive.dart';
import '../../../resource/colors.dart';
import '../../../resource/styles.dart';

class IntroduceSection extends StatelessWidget {
  const IntroduceSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = Responsive.screenHeight(context);
    const double animationPosition = 30;
    const double logoSize = 60;
    const int animationDuration = 500;
    const int delayDuration = 300;

    return Container(
      constraints: BoxConstraints(minHeight: screenHeight),
      alignment: Alignment.center,
      child: SizedBox(
        width: 1000,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomAnimationContainer(
              duration: const Duration(milliseconds: animationDuration),
              position: animationPosition,
              child: Container(
                margin: const EdgeInsets.only(bottom: 30, left: 4),
                child: const Text(
                  'Hi, my name is',
                  style: TextStyle(
                    color: ColorsDef.kPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const CustomAnimationContainer(
              duration: Duration(milliseconds: animationDuration),
              position: animationPosition,
              delayDuration: Duration(milliseconds: delayDuration),
              child: Text(
                'Thoai An',
                style: TextStyle(
                  color: ColorsDef.lightSlate,
                  height: 1.1,
                  fontSize: 80,
                  fontWeight: FontWeight.w600,
                  fontFamily: FontDef.calibre,
                ),
              ),
            ),
            CustomAnimationContainer(
              duration: const Duration(milliseconds: animationDuration),
              position: animationPosition,
              delayDuration: const Duration(milliseconds: delayDuration + 200),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  'I build things for the mobile app.',
                  style: TextStyle(
                    color: ColorsDef.slate,
                    height: 0.9,
                    fontSize: 70,
                    fontWeight: FontWeight.w600,
                    fontFamily: FontDef.calibre,
                  ),
                ),
              ),
            ),
            CustomAnimationContainer(
              duration: const Duration(milliseconds: animationDuration),
              position: animationPosition,
              delayDuration: const Duration(milliseconds: delayDuration + 400),
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                constraints: const BoxConstraints(maxWidth: 540),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(text: "I’m a Mobile Engineer with nearly"),
                      TextSpan(
                        text: " three ",
                        style: TextStyle(
                            // color: ColorsDef.kPrimaryColor,
                            ),
                      ),
                      TextSpan(
                          text:
                              "years of experience on both Android and iOS. Currently, I’m focused on using Flutter to build high quality mobile, web apps that provide seamless user experiences."),
                    ],
                    style: TextStyle(
                      color: ColorsDef.slate,
                      height: 1.3,
                      fontSize: 20,
                      fontFamily: FontDef.calibre,
                    ),
                  ),
                ),
              ),
            ),
            CustomAnimationContainer(
              duration: const Duration(milliseconds: animationDuration),
              position: animationPosition,
              delayDuration: const Duration(milliseconds: delayDuration + 600),
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: logoSize - 15,
                      height: logoSize - 15,
                      margin: const EdgeInsets.only(right: 30),
                      child: Image.asset(
                        path('images/flutter_logo.png'),
                      ),
                    ),
                    Container(
                      width: logoSize,
                      height: logoSize,
                      margin: const EdgeInsets.only(right: 30),
                      child: Image.asset(
                        path('images/dart_logo.png'),
                      ),
                    ),
                    Container(
                      width: logoSize,
                      height: logoSize,
                      margin: const EdgeInsets.only(right: 30),
                      child: Image.asset(
                        path('images/android_logo.png'),
                      ),
                    ),
                    Container(
                      width: logoSize,
                      height: logoSize,
                      margin: const EdgeInsets.only(right: 15),
                      child: Image.asset(
                        path('images/kotlin_logo.png'),
                      ),
                    ),
                    Container(
                      width: logoSize + 34,
                      height: logoSize + 34,
                      margin: const EdgeInsets.only(right: 20),
                      child: Image.asset(
                        path('images/firebase_logo.png'),
                      ),
                    ),
                    SizedBox(
                      width: logoSize - 20,
                      height: logoSize - 20,
                      child: Image.asset(
                        path('images/swift_logo.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomAnimationContainer(
              duration: const Duration(milliseconds: animationDuration),
              position: animationPosition,
              delayDuration: const Duration(milliseconds: delayDuration + 300),
              child: Container(
                width: 200,
                height: 50,
                margin: const EdgeInsets.only(top: 40),
                child:
                    OutlinedButton(onPressed: () {}, child: Text('View more')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
