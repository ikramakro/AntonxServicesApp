import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {this.height, this.width, required this.child, Key? key})
      : super(key: key);
  final double? height;
  final double? width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height ?? 50.h,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.r),
          bottomLeft: Radius.circular(15.r),
          bottomRight: Radius.circular(15.r),
          topLeft: Radius.circular(2.r),
        ),
      ),
      child: Center(child: child),
    );
  }
}
