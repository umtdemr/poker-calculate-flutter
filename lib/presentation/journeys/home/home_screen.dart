import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker/common/constants/size_constants.dart';
import 'package:poker/di/get_it.dart';
import 'package:poker/presentation/blocs/bloc/room_bloc.dart';
import 'package:poker/presentation/journeys/rounds/round_screen.dart';
import 'package:poker/presentation/themes/theme_color.dart';
import 'package:poker/common/extensions/size_extensions.dart';
import 'package:poker/presentation/widget/button.dart';
import 'package:poker/presentation/widget/seperator.dart';
import 'package:poker/presentation/widget/text_field.dart';
import 'package:poker/presentation/widget/text_title.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String accesKey;
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RoomBloc, RoomState>(
        listener: (context, state) {
          print("State değişti" + state.toString());
          if (state is RoomLoaded) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RoundScreen()));
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Hero(
                  tag: 'title-hero',
                  child: TextTitle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextfieldWidget(
                        controller: _controller,
                        hintText: "Oda giriş şifresi",
                        onChange: (value) {
                          setState(() {
                            accesKey = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Button(
                onPressed: () {
                  BlocProvider.of<RoomBloc>(context)
                      .add(EnterRoomEvent(accesKey));
                  _controller.clear();
                },
                text: "Odaya Katıl",
              ),
              SizedBox(
                height: Sizes.dimen_12.h,
              ),
              Seperator(),
              SizedBox(
                height: Sizes.dimen_12.h,
              ),
              Button(
                onPressed: () {},
                text: "Oda Oluştur",
              ),
            ],
          );
        },
      ),
    );
  }
}
