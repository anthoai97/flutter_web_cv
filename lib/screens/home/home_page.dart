import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_cv_web/core/utils/responsive.dart';
import 'package:my_cv_web/entity/section.dart';
import 'package:my_cv_web/screens/home/components/project.dart';
import 'package:my_cv_web/screens/home/components/side_menu.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../controllers/menu_controller.dart';
import 'components/about_me.dart';
import 'components/experience.dart';
import 'components/header.dart';
import 'components/introduce.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.sections,
    required this.sectionNameNotifer,
  }) : super(key: key);

  final List<String> sections;
  final ValueNotifier<SectionModel?> sectionNameNotifer;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  /// Controller to scroll or jump to a particular item.
  final ItemScrollController _itemScrollController = ItemScrollController();

  /// Listener that reports the position of items when the list is scrolled.
  final ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create();

  int get trailingIndex {
    /// Determine the first visible item by finding the item with the
    /// smallest trailing edge that is greater than 0.  i.e. the first
    /// item whose trailing edge in visible in the viewport.
    final firstVisibleSectionIndex = _itemPositionsListener.itemPositions.value
        .where((ItemPosition position) => position.itemTrailingEdge > 0)
        .reduce((ItemPosition min, ItemPosition position) =>
            position.itemTrailingEdge < min.itemTrailingEdge ? position : min)
        .index;
    return firstVisibleSectionIndex;
  }

  int get sectionIndex {
    int index = widget.sections.indexWhere((element) {
      final section = widget.sectionNameNotifer.value?.name;
      return element == section;
    });
    return index > -1 ? index : 0;
  }

  bool _isScrollDown = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _scrollToIndex();
      widget.sectionNameNotifer.addListener(() {
        final fromScroll = widget.sectionNameNotifer.value?.source ==
            SectionSelectionSource.fromScroll;
        if (_itemScrollController.isAttached && !fromScroll) {
          _scrollToIndex();
        }
      });
    });
  }

  void _scrollToIndex() {
    if (sectionIndex >= 1) {
      setState(() {
        _isScrollDown = false;
      });
    } else {
      setState(() {
        _isScrollDown = true;
      });
    }

    _itemScrollController.scrollTo(
      index: sectionIndex,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  final List<Widget> _listPage = [
    const IntroduceSection(),
    const AboutMeSection(),
    const Experience(),
    const Project(),
  ];

  @override
  Widget build(BuildContext context) {
    print('build');
    final isDesktop = Responsive.isDesktop(context);
    const double maxWidth = 1000;
    final double mainPadding = isDesktop ? 150 : 25;
    final double screenHeight = Responsive.screenHeight(context);

    return NotificationListener<UserScrollNotification>(
      onNotification: ((notification) {
        widget.sectionNameNotifer.value = SectionModel(
          name: widget.sections[trailingIndex],
          source: SectionSelectionSource.fromScroll,
        );

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
              ScrollablePositionedList.builder(
                scrollDirection: Axis.vertical,
                itemScrollController: _itemScrollController,
                itemPositionsListener: _itemPositionsListener,
                physics: const AlwaysScrollableScrollPhysics(),
                addAutomaticKeepAlives: false,
                itemCount: _listPage.length,
                itemBuilder: (BuildContext context, int index) {
                  return _listPage[index];
                },
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
                          sectionNameNotifer: widget.sectionNameNotifer,
                          showShadow: !(sectionIndex == 0),
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
