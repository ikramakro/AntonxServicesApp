// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_button.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/rounded_container.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/booking_screen/cancelledscreen.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CancelledTab extends StatefulWidget {
  const CancelledTab({Key? key}) : super(key: key);

  @override
  State<CancelledTab> createState() => _CancelledTabState();
}

class _CancelledTabState extends State<CancelledTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhitecolor,
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cancelled', style: kHead6),
                SizedBox(
                  height: 25.h,
                ),
                RoundedContainer(
                  height: 312.h,
                  width: 311.w,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Booking no #12KL23", style: kHead16),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Working time",
                          style: khead14,
                        ),
                        Text("Monday - 22 Mar 2021 - 12:30 PM", style: khead15),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text("Location", style: khead14),
                        Text("Room 123, Brooklyn St, Kepler District",
                            style: khead15),
                        SizedBox(
                          height: 30.h,
                        ),
                        Image.asset('Assets/Images/Progress.png'),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Text(
                          'Janet is on the way',
                          style: TextStyle(color: ksecondaryColor),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomButton(
                            color: kgreycolor,
                            ontap: () {
                              Get.to(const CancelledScreen());
                            },
                            height: 50.h,
                            width: 280.w,
                            child: Center(
                                child: Text(
                              'View',
                              style: kHead4,
                            ))),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
