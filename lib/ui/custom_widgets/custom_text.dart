// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  double size;
  Color? color;
  FontWeight? fontWeight;
  CustomText(
      {Key? key,
      required this.text,
      required this.size,
      this.color,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle());
  }
}
