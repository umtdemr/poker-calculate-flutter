import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker/common/constants/size_constants.dart';
import 'package:poker/presentation/blocs/bloc/room_bloc.dart';
import 'package:poker/presentation/themes/theme_color.dart';
import 'package:poker/presentation/widget/button.dart';
import 'package:poker/presentation/widget/text_field.dart';
import 'package:poker/common/extensions/size_extensions.dart';

class CreateRoomScreen extends StatefulWidget {
  @override
  _CreateRoomScreenState createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  double roomPrice;
  String addingName;
  List<Map<String, dynamic>> users = [
    {"name": "umit", "money": 100.0},
    {"name": "kadir", "money": 100.0},
    {"name": "mert", "money": 100.0},
    {"name": "fatih", "money": 100.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Oda oluşturma"),
      ),
      body: Padding(
        padding: EdgeInsets.all(Sizes.dimen_16.w),
        child: Column(
          children: [
            TextfieldWidget(
              hintText: "Ad giriniz",
              onChange: (value) {
                setState(() {
                  addingName = value;
                });
              },
            ),
            Button(
              onPressed: () {
                setState(() {
                  users.add({"name": addingName, "money": 100.0});
                });
              },
              text: "Ekle",
            ),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: Sizes.dimen_4.h),
                    padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_8.w),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColor.royalBlue, AppColor.violet],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            Text(users[index]["name"]),
                            SizedBox(
                              width: Sizes.dimen_18.w,
                            ),
                            Text('${users[index]["money"].toString()} ₺'),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              users.removeAt(index);
                            });
                          },
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: Sizes.dimen_16.h,
            ),
            TextfieldWidget(
              hintText: "Başlangıç Parası",
              onChange: (value) {
                setState(() {
                  roomPrice = double.parse(value);
                });
              },
            ),
            Button(
              text: "Oda oluştur",
              onPressed: () {
                setState(() {
                  users = users.map((e) {
                    e["money"] = roomPrice;
                    return e;
                  }).toList();
                  BlocProvider.of<RoomBloc>(context).add(
                    CreateRoomEvent(users),
                  );
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
