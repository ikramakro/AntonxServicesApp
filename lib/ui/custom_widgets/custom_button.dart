// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  VoidCallback ontap;
  double height, width;
  Widget child;
  Color color;

  CustomButton(
      {Key? key,
      required this.ontap,
      required this.height,
      required this.width,
      required this.child,
      this.color = kwhitecolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 11.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: color,
          ),
          child: child),
    );
  }
}
