import 'package:flutter/material.dart';
import 'package:my_cv_web/controllers/menu_controller.dart';
import 'package:my_cv_web/resource/colors.dart';
import 'package:provider/provider.dart';

import '../../../widgets/header_nav_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsDef.backgroundColor,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          DrawerHeader(
            padding: const EdgeInsets.only(right: 5, top: 25),
            child: Container(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  context.read<MenuController>().controlMenu();
                },
                child: const Icon(
                  Icons.close,
                  size: 40,
                  color: ColorsDef.kPrimaryColor,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeaderNavbarItem(
                  content: "About",
                  index: 1,
                  onPress: () {},
                ),
                HeaderNavbarItem(
                  content: "Experience",
                  index: 2,
                  onPress: () {},
                ),
                HeaderNavbarItem(
                  content: "Work",
                  index: 3,
                  onPress: () {},
                ),
                HeaderNavbarItem(
                  content: "Contact",
                  index: 4,
                  onPress: () {},
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    height: 45,
                    width: 150,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Resume'),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
