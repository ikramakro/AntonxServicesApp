// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/core/models/other_models/onboarding.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/auth_signup/login/login_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/auth_signup/sign_up/sign_up_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/onboarding/onboarding_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

///
/// Flow logic is already done. Just need
/// to add the UI and UI Logic.
///

class OnboardingScreen extends StatefulWidget {
  final int currentIndex;
  final List<Onboarding> onboardingList;
  final List<Image> preCachedImages;
  const OnboardingScreen({
    Key? key,
    this.currentIndex = 0,
    required this.onboardingList,
    required this.preCachedImages,
  }) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('@onboardingScreen');
    return ChangeNotifierProvider(
      create: (context) =>
          // ignore: unnecessary_this
          OnboardingViewModel(widget.currentIndex, this.widget.onboardingList),
      child: Consumer<OnboardingViewModel>(
        builder: (context, model, child) => SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CarouselSlider(
                    items: List.generate(
                      model.onboardingList.length,
                      (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.w),
                        // width: MediaQuery.of(context).size.width + 200.w,
                        width: 260.w,
                        height: 300.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: widget
                                .preCachedImages[model.currentPageIndex].image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    options: CarouselOptions(
                      height: 253.h,
                      aspectRatio: 0.9,
                      initialPage: 0,
                      viewportFraction: 0.8,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      onPageChanged: (index, reason) {
                        model.updatePage(index);
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 50.w),
                    child: Center(
                      child: Text(
                          "${model.onboardingList[model.currentPageIndex].title}",
                          textAlign: TextAlign.center,
                          style: kHead1),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.h, horizontal: 75.w),
                    child: Center(
                      child: Text(
                          "${model.onboardingList[model.currentPageIndex].description}",
                          textAlign: TextAlign.center,
                          style: smallTax),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 70.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 120.w, top: 20.h),
                          child: Row(
                            children: List.generate(
                                model.onboardingList.length,
                                (index) => Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.h),
                                      child: AnimatedContainer(
                                        height: 6,
                                        width: index == model.currentPageIndex
                                            ? 35
                                            : 10,
                                        curve: Curves.easeIn,
                                        duration: const Duration(seconds: 1),
                                        decoration: BoxDecoration(
                                            color:
                                                index == model.currentPageIndex
                                                    ? ksecondaryColor
                                                    : const Color(0xffEAEAFF),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                    )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  model.currentPageIndex == 2
                      ? Padding(
                          padding: EdgeInsets.only(top: 100.h),
                          child: Text('Welcome, let’s get started!',
                              style: kHead2),
                        )
                      : Padding(
                          padding: EdgeInsets.only(top: 100.h),
                          child: const Text(''),
                        ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _skipButton(model),
                      nextButton(model),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _skipButton(OnboardingViewModel model) {
    return InkWell(
      onTap: () {
        if (model.currentPageIndex == 1) {
          model.updatePage(model.currentPageIndex - 1);
        } else {
          Get.to(() => LoginScreen());
        }
      },
      child: Container(
        height: 50.h,
        width: 120.w,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 11.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.grey[100],
        ),
        child: Center(
            child: model.currentPageIndex == 0 || model.currentPageIndex == 1
                ? Text(model.currentPageIndex == 0 ? "Skip" : 'Back',
                    style: kHead3)
                : Text('Login', style: kHead4)),
      ),
    );
  }

  Widget nextButton(OnboardingViewModel model) {
    return InkWell(
      onTap: () {
        if (model.currentPageIndex == 2) {
          Get.to(() => SignUpScreen());
        } else {
          model.updatePage(model.currentPageIndex + 1);
        }
      },
      child: Container(
        height: 50,
        width: 120.w,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 11.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14), color: kprimaryColor),
        child: Center(
          child: Text(model.currentPageIndex == 2 ? 'Sign up' : "Next",
              style: kHead5),
        ),
      ),
    );
  }
}
