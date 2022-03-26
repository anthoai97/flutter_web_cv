import 'package:flutter/material.dart';
import 'package:my_cv_web/controllers/menu_controller.dart';
import 'package:my_cv_web/resource/colors.dart';
import 'package:my_cv_web/resource/styles.dart';
import 'package:my_cv_web/router/router.dart';
import 'package:my_cv_web/router/single_page_app_route_information_parser.dart';
import 'package:my_cv_web/router/single_page_app_router_delegate.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuController(),
        )
      ],
      child: MaterialApp.router(
        title: "Thoại An",
        theme: ThemeData(
          scaffoldBackgroundColor: ColorsDef.backgroundColor,
          fontFamily: FontDef.sFMono,
          primaryColor: ColorsDef.kPrimaryColor,
          buttonTheme: const ButtonThemeData(height: 50),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              alignment: Alignment.center,
              backgroundColor: ColorsDef.backgroundColor,
              primary: ColorsDef.kPrimaryColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  DimenDef.borderRadius,
                ),
              ),
              side: const BorderSide(
                color: ColorsDef.kPrimaryColor,
                width: 1,
                style: BorderStyle.solid,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        routerDelegate: SinglePageAppRouterDelegate(
            sections: AppRouter.homePageSectionNames),
        routeInformationParser: SinglePageAppRouteInformationParser(
            sections: AppRouter.homePageSectionNames),
      ),
    );
  }
}
