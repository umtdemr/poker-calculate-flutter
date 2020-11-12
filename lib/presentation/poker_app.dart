import 'package:flutter/material.dart';
import 'package:poker/presentation/themes/theme_color.dart';
import 'package:poker/presentation/themes/theme_text.dart';

import 'journeys/home/home_screen.dart';

class PokerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Poker Admin",
      theme: ThemeData(
        accentColor: AppColor.royalBlue,
        scaffoldBackgroundColor: AppColor.vulcan,
        primaryColor: AppColor.vulcan,
        unselectedWidgetColor: AppColor.royalBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        //textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
