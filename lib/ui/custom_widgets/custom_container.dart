// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({this.height, this.width, required this.child, Key? key})
      : super(key: key);
  final double? height;
  final double? width;
  final Widget? child;
  Radius raduis = Radius.circular(15.r);
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height ?? 50.h,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: kwhitecolor,
        borderRadius: BorderRadius.only(
          topRight: raduis,
          bottomLeft: raduis,
          bottomRight: raduis,
          topLeft: Radius.circular(2.r),
        ),
      ),
      child: Center(child: child),
    );
  }
}
