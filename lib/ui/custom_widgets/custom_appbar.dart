import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/image_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 237.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xff6E6BE8),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(45.r),
              bottomRight: Radius.circular(45.r))),
      child: Stack(children: [
        Positioned(
          left: 13,
          bottom: 13,
          child: ImageContainer(
            assets: "Assets/Images/appbar_bg_star.png",
            height: 33.h,
            width: 33.w,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          right: 11,
          bottom: 77,
          child: ImageContainer(
            assets: "Assets/Images/appbar_bg_star.png",
            height: 17.h,
            width: 17.w,
            fit: BoxFit.contain,
          ),
        ),
      ]),
    );
  }
}
