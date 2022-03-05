import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:my_cv_web/controllers/menu_controller.dart';
import 'package:my_cv_web/resource/colors.dart';
import 'package:my_cv_web/resource/styles.dart';
import 'package:my_cv_web/screens/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // FlutterNativeSplash.remove();

    return MaterialApp(
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
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (context) => MenuController(),
        )
      ], child: const MainPage()),
    );
  }
}
