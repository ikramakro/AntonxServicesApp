// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_button.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_row.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/rounded_container.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/Review%20Screen/asking_for_review_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/booking_screen/booking_againScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 40.h, bottom: 40),
        child: Column(
          children: [
            CustomRow(text: 'Booking #12KL23'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 36.w),
              child: Image.asset('Assets/Images/Completed Progress.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 240, bottom: 30),
              child: Text(
                'Completed',
                style: TextStyle(
                    color: ksecondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp),
              ),
            ),
            RoundedContainer(
              height: 449.h,
              width: 311.w,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Booking detail",
                      style: kHead12,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Working time',
                      style: khead14,
                    ),
                    Text(
                      'Monday - 22 Mar 2021 12:30 PM',
                      style: khead15,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Location',
                      style: khead14,
                    ),
                    Text(
                      'Room 123, Brooklyn St, Kepler District',
                      style: khead15,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Note',
                      style: khead14,
                    ),
                    Text(
                      'No note added',
                      style: khead15,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Domestic worker',
                      style: khead14,
                    ),
                    Text(
                      'Janet Kim',
                      style: khead15,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Working hour',
                      style: khead14,
                    ),
                    Text(
                      '3 hours - 12:30 PM to 15:30 PM ',
                      style: khead15,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Cost',
                      style: khead14,
                    ),
                    Text(
                      '\$37.50 ',
                      style: khead15,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Method',
                      style: khead14,
                    ),
                    Text(
                      'Credit Card',
                      style: khead15,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              CustomButton(
                color: kgreycolor,
                ontap: () {
                  Get.to(const AskingForReviewScreen());
                },
                height: 46.h,
                width: 127.w,
                child: Center(
                  child: Text('Review', style: kHead4),
                ),
              ),
              CustomButton(
                ontap: () {
                  Get.to(BookingAgainScreen());
                },
                height: 46.h,
                width: 127.w,
                color: kcontainerbg,
                child: const Center(
                  child: Text('Booking again', style: kHead18),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
