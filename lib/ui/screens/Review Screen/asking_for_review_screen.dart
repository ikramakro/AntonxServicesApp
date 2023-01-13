// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_button.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_text.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/Review%20Screen/reviewscreen.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AskingForReviewScreen extends StatelessWidget {
  const AskingForReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: kprimaryColor),
                borderRadius: BorderRadius.circular(10)),
            child: const Icon(
              Icons.arrow_back_sharp,
              color: kprimaryColor,
            ),
          ),
        ),
        title: const Center(
          child: Text(
            'Booking #12KL23 ',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 75.w),
            child: Image.asset('Assets/Images/review.png'),
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomText(text: 'How do you feel?', size: 22.sp),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.w),
            child: CustomText(
              text: '''We’re here to listen to your comment.
  Send us a review and get a voucher 
         5% off on your next booking!''',
              size: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                ontap: () {
                  Get.to(const ReviewScreen());
                },
                height: 56.h,
                width: 148.w,
                color: kprimaryColor,
                child: const Center(
                  child: Text(
                    'Review',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              CustomButton(
                ontap: () {},
                height: 56.h,
                width: 148.w,
                color: const Color(0xffF4F3FD),
                child: const Center(
                  child: Text(
                    'Home',
                    style: TextStyle(
                        color: kprimaryColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
