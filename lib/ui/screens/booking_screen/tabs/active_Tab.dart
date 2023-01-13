// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_button.dart';

import 'package:flutter_antonx_boilerplate/ui/custom_widgets/rounded_Container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActiveTab extends StatefulWidget {
  const ActiveTab({Key? key}) : super(key: key);

  @override
  State<ActiveTab> createState() => _ActiveTabState();
}

class _ActiveTabState extends State<ActiveTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhitecolor,
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Processing', style: kHead16),
                SizedBox(
                  height: 25.h,
                ),
                RoundedContainer(
                  height: 312,
                  width: 311,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Booking no #12KL23",
                          style: kHead17,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text("Working time", style: khead14),
                        Text("Monday - 22 Mar 2021 - 12:30 PM", style: khead15),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Location",
                          style: khead14,
                        ),
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
                            ontap: () {},
                            height: 50.h,
                            width: 280.w,
                            child: Center(child: Text('View', style: kHead4))),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
