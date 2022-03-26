import 'package:flutter/material.dart';
import 'package:my_cv_web/entity/section.dart';
import 'package:my_cv_web/screens/home/home_page.dart';
import 'package:my_cv_web/screens/plash/web_plash_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
    required this.sections,
    required this.sectionNameNotifer,
  }) : super(key: key);

  final List<String> sections;
  final ValueNotifier<SectionModel?> sectionNameNotifer;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? WebPlashPage(
              onCompleteAnimation: () {
                setState(() {
                  loading = false;
                });
              },
            )
          : HomePage(
              sections: widget.sections,
              sectionNameNotifer: widget.sectionNameNotifer,
            ),
      // body: HomePage(),
    );
  }
}
