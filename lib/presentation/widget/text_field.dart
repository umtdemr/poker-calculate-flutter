import 'package:flutter/material.dart';
import 'package:poker/presentation/themes/theme_color.dart';

class TextfieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function onChange;
  final String hintText;
  const TextfieldWidget(
      {Key key, this.onChange, this.hintText, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText ?? "deneem",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: AppColor.royalBlue,
      ),
      onChanged: (value) => onChange(value),
      controller: controller,
    );
  }
}
