import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker/common/screenutil/screenutil.dart';
import 'package:poker/di/get_it.dart';
import 'package:poker/presentation/blocs/bloc/room_bloc.dart';
import 'package:poker/presentation/themes/theme_color.dart';
import 'package:poker/presentation/themes/theme_text.dart';

import 'journeys/home/home_screen.dart';

class PokerApp extends StatefulWidget {
  @override
  _PokerAppState createState() => _PokerAppState();
}

class _PokerAppState extends State<PokerApp> {
  RoomBloc roomBloc;

  @override
  void initState() {
    super.initState();
    roomBloc = RoomBloc(
      getItInstance(),
      getItInstance(),
      getItInstance(),
      getItInstance(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    roomBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return BlocProvider(
      create: (context) => roomBloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Poker Admin",
        theme: ThemeData(
          accentColor: AppColor.royalBlue,
          scaffoldBackgroundColor: AppColor.vulcan,
          primaryColor: AppColor.vulcan,
          unselectedWidgetColor: AppColor.royalBlue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: ThemeText.getTextTheme(),
          appBarTheme: const AppBarTheme(
            elevation: 0,
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
