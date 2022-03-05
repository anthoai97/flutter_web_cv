import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_cv_web/core/utils/responsive.dart';
import 'package:my_cv_web/resource/colors.dart';
import 'package:my_cv_web/screens/home/components/side_menu.dart';
import 'package:my_cv_web/widgets/custom_animation_container.dart';
import 'package:provider/provider.dart';

import '../../controllers/menu_controller.dart';
import '../../resource/styles.dart';
import '../../widgets/section_title.dart';
import 'components/about_me.dart';
import 'components/header.dart';
import 'components/introduce.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<int> lists = List<int>.generate(50, (index) => index);
  late ScrollController _scrollController;

  bool _isScrollDown = true;
  bool _onTop = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset < 100) {
        _onTop = true;
      } else {
        _onTop = false;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    const double maxWidth = 1000;
    final double mainPadding = isDesktop ? 150 : 25;
    final double screenHeight = Responsive.screenHeight(context);

    return NotificationListener<UserScrollNotification>(
      onNotification: ((notification) {
        if (notification.direction == ScrollDirection.forward) {
          setState(() => _isScrollDown = true);
        } else if (notification.direction == ScrollDirection.reverse) {
          setState(() {
            _isScrollDown = false;
          });
        }
        return true;
      }),
      child: Scaffold(
        key: context.read<MenuController>().scaffoldKey,
        endDrawer: const SideMenu(),
        endDrawerEnableOpenDragGesture: false,
        body: SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      Container(
                        constraints: const BoxConstraints(maxWidth: maxWidth),
                        child: Column(
                          children: const [
                            IntroduceSection(),
                            AboutMeSection(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: !_isScrollDown
                      ? Container()
                      : Header(
                          showShadow: !_onTop,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
