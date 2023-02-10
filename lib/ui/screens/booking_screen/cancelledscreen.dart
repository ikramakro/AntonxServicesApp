import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_button.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_row.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/rounded_container.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/Review%20Screen/asking_for_review_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/booking_screen/booking_againScreen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/booking_screen/completed_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CancelledScreen extends StatelessWidget {
  const CancelledScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h),
        child: Column(
          children: [
            CustomRow(text: 'Cancelled'),
            SizedBox(
              height: 30.h,
            ),
            RoundedContainer(
              height: 232,
              width: 311,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Booking no #12KL23", style: kHead16),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Monday - 22 Mar 2021 - 12:30 PM", style: khead14),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text("Room 123, Brooklyn St, Kepler District",
                        style: khead15),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text("Danny Johnson", style: khead14),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          color: kgreycolor,
                          ontap: () {
                            Get.to(const CompletedScreen());
                          },
                          height: 46.h,
                          width: 127.w,
                          child: Center(
                            child: Text('View', style: kHead4),
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            RoundedContainer(
              height: 232,
              width: 311,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Booking no #12KL23",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Monday - 22 Mar 2021 - 12:30 PM", style: khead15),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text("Room 123, Brooklyn St, Kepler District",
                        style: khead15),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text("Danny Johnson", style: khead15),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          color: kgreycolor,
                          ontap: () {
                            Get.to(const AskingForReviewScreen());
                          },
                          height: 46.h,
                          width: 127.w,
                          child: Center(
                            child: Text('View', style: kHead4),
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
