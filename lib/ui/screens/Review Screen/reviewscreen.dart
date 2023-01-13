// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_button.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_row.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_text.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/rounded_container.dart';

import 'package:flutter_antonx_boilerplate/ui/screens/Review%20Screen/review_screen_view_modal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  TextEditingController controller = TextEditingController();
  String text = 'Careful and on time';
  String text1 = 'Good job!';
  String text2 = 'Very clean!';
  int coloricon = -1;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ReviewScreenViewModal(),
        builder: (context, child) {
          return Consumer<ReviewScreenViewModal>(
            builder: (context, value, child) {
              return Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.h),
                    child: Column(
                      children: [
                        CustomRow(text: 'Review'),
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: CustomText(text: '''What do you think about 
          Janet’s work?''', size: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset('Assets/Images/Avatar.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 80),
                          child: SizedBox(
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return IconButton(
                                    onPressed: () {
                                      setState(() {
                                        coloricon = index;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.star_rate_rounded,
                                      color: index <= coloricon
                                          ? Colors.amber
                                          : Colors.grey,
                                      size: 40,
                                    ));
                              },
                            ),
                          ),
                        ),
                        Switch(
                          value: true,
                          onChanged: (value) {},
                          activeColor: Colors.white,
                          activeTrackColor: kprimaryColor,
                        ),
                        Container(
                          height: 200,
                          width: 350,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    controller: value.getController(),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            '    Leave your comment here')),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        value.setController(text);
                                      },
                                      child: Chip(
                                        label: CustomText(
                                          text: text,
                                          size: 14,
                                          fontWeight: FontWeight.normal,
                                          color: kprimaryColor,
                                        ),
                                        backgroundColor: Colors.white,
                                        side: const BorderSide(
                                            color: kprimaryColor),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                      )),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        value.setController(text1);
                                      },
                                      child: Chip(
                                        label: CustomText(
                                          text: text1,
                                          size: 14,
                                          fontWeight: FontWeight.normal,
                                          color: kprimaryColor,
                                        ),
                                        backgroundColor: Colors.white,
                                        side: const BorderSide(
                                            color: kprimaryColor),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                      )),
                                ],
                              ),
                              InkWell(
                                  onTap: () {
                                    value.setController(text2);
                                  },
                                  child: Chip(
                                    label: CustomText(
                                      text: text2,
                                      size: 14,
                                      fontWeight: FontWeight.normal,
                                      color: kprimaryColor,
                                    ),
                                    backgroundColor: Colors.white,
                                    side:
                                        const BorderSide(color: kprimaryColor),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 194.w, top: 10.h),
                          child: Text(
                            'Upload a picture',
                            style: kHead5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RoundedContainer(
                                  height: 85,
                                  width: 85,
                                  child: Image.asset(
                                      'Assets/Images/Rectangle 14.png')),
                              RoundedContainer(
                                  height: 85,
                                  width: 85,
                                  child: const Center(
                                    child: Icon(Icons.add),
                                  )),
                              RoundedContainer(
                                  height: 85,
                                  width: 85,
                                  child: const Center(
                                    child: Icon(Icons.add),
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 80),
                          child: Row(
                            children: [
                              Text(
                                'Have a problem with our service?',
                                style: kHead8,
                              ),
                              const Text(
                                ' Let us know',
                                style: TextStyle(
                                    color: kprimaryColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: CustomButton(
                              ontap: () {},
                              height: 50.h,
                              width: 320.w,
                              color: kprimaryColor,
                              child: const Center(
                                  child: Text(
                                'Send your review',
                                style: TextStyle(
                                    color: kwhitecolor,
                                    fontWeight: FontWeight.bold),
                              ))),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
