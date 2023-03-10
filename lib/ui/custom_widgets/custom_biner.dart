// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBiner extends StatelessWidget {
  String image;
  CustomBiner({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Image.asset(image),
          Positioned(
            left: 217,
            top: 36,
            child: Text(
              'Full Pack',
              style: kHead9,
            ),
          ),
          Positioned(
            left: 180,
            top: 56,
            child: Text(
              '50% OFF',
              style: kHead,
            ),
          ),
          Positioned(
            left: 190,
            top: 100,
            child: Container(
              height: 35.h,
              width: 90.w,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 11.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: kwhitecolor,
              ),
              child: Center(
                  child: Text(
                'Book Now',
                style: kHead10,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
