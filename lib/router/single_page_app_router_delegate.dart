import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_cv_web/entity/section.dart';
import 'package:my_cv_web/router/router_config.dart';
import 'package:my_cv_web/screens/main_page.dart';
import 'package:my_cv_web/screens/unknow/unknow.dart';

class SinglePageAppRouterDelegate
    extends RouterDelegate<SinglePageAppConfiguration>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<SinglePageAppConfiguration> {
  //
  final List<String> sections;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  late Page _homePage;

  // App state field
  final ValueNotifier<SectionModel?> _sectionNameNotifer = ValueNotifier(null);
  final ValueNotifier<bool?> _unknownStateNotifier = ValueNotifier(null);

  String get defaultSectionName => sections.first;

  SinglePageAppRouterDelegate({required this.sections}) {
    _homePage = MaterialPage(
        key: const ValueKey<String>("HomePage"),
        child: MainPage(
          sections: sections,
          sectionNameNotifer: _sectionNameNotifer,
        ));

    Listenable.merge([
      _sectionNameNotifer,
    ]).addListener(() {
      if (kDebugMode) {
        print("notifying the router widget");
      }
      notifyListeners();
    });
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  SinglePageAppConfiguration? get currentConfiguration {
    if (_unknownStateNotifier.value == true) {
      return SinglePageAppConfiguration.unknown();
    } else {
      return SinglePageAppConfiguration.home(
        sectionName: _sectionNameNotifer.value?.name,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: _unknownStateNotifier.value == true
          ? [
              const MaterialPage(
                key: ValueKey<String>("Unknown"),
                child: UnknownScreen(),
              )
            ]
          : [
              _homePage,
              //  Create dialog route
              //  if (colorCode != null && shapeBorderType != null)
              //   ShapePage(
              //     colorCode: colorCode.hexColorCode,
              //     shapeBorderType: shapeBorderType,
              //   ),
            ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(SinglePageAppConfiguration configuration) async {
    if (configuration.unknown) {
      _unknownStateNotifier.value = true;
      _sectionNameNotifer.value = null;
    } else if (configuration.isHomePage) {
      _unknownStateNotifier.value = false;
      _sectionNameNotifer.value = SectionModel(
        name: configuration.sectionName ?? defaultSectionName,
        source: SectionSelectionSource.fromBrowserAddressBar,
      );
    }
  }
}
