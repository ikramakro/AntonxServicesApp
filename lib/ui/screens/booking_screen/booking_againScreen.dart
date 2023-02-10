// ignore_for_file: file_names, must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_button.dart';

import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_row.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/rounded_container.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BookingAgainScreen extends StatelessWidget {
  BookingAgainScreen({Key? key}) : super(key: key);
  // ignore: prefer_const_declarations
  static final CameraPosition cameraPosition =
      const CameraPosition(target: LatLng(34.0151, 71.5249), zoom: 14);

  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhitecolor,
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            CustomRow(text: 'Booking #12KL23'),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 36.w),
                child: ListView(children: [
                  Image.asset('Assets/Images/BookingAgainProgress.png'),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Text('Janet is on the way', style: kHead13),
                  SizedBox(
                    height: 20.h,
                  ),
                  RoundedContainer(
                    height: 358,
                    width: 311,
                    child: GoogleMap(
                      initialCameraPosition: cameraPosition,
                      myLocationEnabled: true,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  ),
                  RoundedContainer(
                    height: 449.h,
                    width: 311.w,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
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
                    height: 20.h,
                  ),
                  CustomButton(
                      color: kgreycolor,
                      ontap: () {},
                      height: 46.h,
                      width: 311.w,
                      child: const Center(
                          child: Text(
                        'Cancel your booking',
                      ))),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
