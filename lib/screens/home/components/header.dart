import 'package:flutter/material.dart';
import 'package:my_cv_web/controllers/menu_controller.dart';
import 'package:my_cv_web/core/utils/responsive.dart';
import 'package:my_cv_web/core/utils/utils.dart';
import 'package:my_cv_web/entity/section.dart';
import 'package:my_cv_web/resource/colors.dart';
import 'package:my_cv_web/resource/images.dart';
import 'package:my_cv_web/router/router.dart';
import 'package:my_cv_web/widgets/custom_animation_container.dart';
import 'package:provider/provider.dart';

import '../../../widgets/header_nav_item.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    this.showShadow = false,
    required this.sectionNameNotifer,
  }) : super(key: key);

  final ValueNotifier<SectionModel?> sectionNameNotifer;

  final bool showShadow;

  void onPressRoute(index) {
    sectionNameNotifer.value = SectionModel(
      name: AppRouter.homePageSectionNames[index],
      source: SectionSelectionSource.fromButtonClick,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Container(
      height: 100,
      // width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: showShadow
              ? ColorsDef.backgroundColor.withOpacity(0.9)
              : ColorsDef.backgroundColor,
          boxShadow: showShadow
              ? const [
                  BoxShadow(
                    color: ColorsDef.naviShadow,
                    offset: Offset(0, 10),
                    blurRadius: 30,
                    spreadRadius: -10,
                  )
                ]
              : null),
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 50 : 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            path(ResImage.logo),
            width: 46,
            height: 46,
          ),
          isDesktop
              ? Row(
                  children: [
                    HeaderNavbarItem(
                      content: "Introduction",
                      index: 0,
                      onPress: () {
                        onPressRoute(0);
                      },
                      durationMilliseconds: 300,
                    ),
                    HeaderNavbarItem(
                      content: "About",
                      index: 1,
                      onPress: () {
                        onPressRoute(1);
                      },
                      durationMilliseconds: 300,
                    ),
                    HeaderNavbarItem(
                      content: "Experience",
                      index: 2,
                      onPress: () {
                        onPressRoute(2);
                      },
                      durationMilliseconds: 400,
                    ),
                    HeaderNavbarItem(
                      content: "Work",
                      index: 3,
                      onPress: () {
                        onPressRoute(3);
                      },
                      durationMilliseconds: 500,
                    ),
                    HeaderNavbarItem(
                      content: "Contact",
                      index: 4,
                      onPress: () {
                        onPressRoute(4);
                      },
                      durationMilliseconds: 600,
                    ),
                    const SizedBox(width: 15),
                    CustomAnimationContainer(
                      duration: const Duration(milliseconds: 700),
                      position: 20,
                      type: CustomTranslateType.down,
                      child: SizedBox(
                        height: 40,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text('Resume'),
                        ),
                      ),
                    ),
                  ],
                )
              : GestureDetector(
                  onTap: () {
                    context.read<MenuController>().controlMenu();
                  },
                  child: const Icon(
                    Icons.menu,
                    color: ColorsDef.kPrimaryColor,
                    size: 35,
                  ),
                ),
        ],
      ),
    );
  }
}
