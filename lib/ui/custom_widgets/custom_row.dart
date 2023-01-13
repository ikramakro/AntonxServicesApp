// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRow extends StatelessWidget {
  String text;
  Color? color;
  CustomRow({Key? key, required this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: color ?? kprimaryColor),
                borderRadius: BorderRadius.circular(10)),
            child: Icon(
              Icons.arrow_back_sharp,
              color: color ?? kprimaryColor,
            ),
          ),
        ),
        SizedBox(
          width: 100.w,
        ),
        Text(text,
            style:kHead6),
      ],
    );
  }
}
