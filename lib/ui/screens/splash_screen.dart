// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/models/other_models/onboarding.dart';
import 'package:flutter_antonx_boilerplate/core/others/logger_customizations/custom_logger.dart';
import 'package:flutter_antonx_boilerplate/core/services/auth_service.dart';
import 'package:flutter_antonx_boilerplate/core/services/local_storage_service.dart';
import 'package:flutter_antonx_boilerplate/locator.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/root/root_screen.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _authService = locator<AuthService>();
  final _localStorageService = locator<LocalStorageService>();
  // final _notificationService = locator<NotificationsService>();
  List<Onboarding> onboardingList = [];
  final Logger log = CustomLogger(className: 'Splash Screen');

  @override
  void didChangeDependencies() {
    _initialSetup();
    super.didChangeDependencies();
  }

  _initialSetup() async {
    await _localStorageService.init();

    ///
    /// If not connected to internet, show an alert dialog
    /// to activate the network connection.
    ///
    // final connectivityResult = await Connectivity().checkConnectivity();
    // if (connectivityResult == ConnectivityResult.none) {
    //   Get.dialog(const NetworkErrorDialog());
    //   return;
    // }

    ///
    ///initializing notification services
    ///
    // await NotificationsService().initConfigure();
    // var fcm = await NotificationsService().getFcmToken();
    // print("FCM TOKEN is =====> $fcm");
    // await _notificationService.initConfigure();

    ///getting onboarding data for pre loading purpose
    onboardingList = await _getOnboardingData();

    /// routing to the last onboarding screen user seen
    if (_localStorageService.onBoardingPageCount + 1 < onboardingList.length) {
      final List<Image> preCachedImages =
          await _preCacheOnboardingImages(onboardingList);
      await Get.to(() => OnboardingScreen(
          currentIndex: _localStorageService.onBoardingPageCount,
          onboardingList: onboardingList,
          preCachedImages: preCachedImages));
      return;
    }
    await _authService.doSetup();

    ///
    ///checking if the user is login or not
    ///
    log.d('@_initialSetup. Login State: ${_authService.isLogin}');
    if (_authService.isLogin) {
      Get.off(() => const RootScreen());
    } else {
      Timer(
          const Duration(seconds: 2), () => Get.off(() => const RootScreen()));
    }
  }

  Future<List<Image>> _preCacheOnboardingImages(
      List<Onboarding> onboardingList) async {
    List<Image> preCachedImages =
        onboardingList.map((e) => Image.asset(e.imgUrl!)).toList();
    for (Image preCacheImg in preCachedImages) {
      await precacheImage(preCacheImg.image, context);
    }
    return preCachedImages;
  }

  // ignore: unused_element
  _getOnboardingData() async {
    ///uncomment below code

    // final response = await _dbService.getOnboardingData();
    // if (response.success) {
    //   return response.onboardingsList;
    // } else {
    //   return [];
    // }
    List<Onboarding> onboardings = [
      Onboarding('Assets/Images/onboardingpic.png', 'Quick and Easy Booking',
          'We offer a 3-step booking which solves your problem quickly and easily'),
      Onboarding(
          'Assets/Images/onboarding2.png',
          'Sercurity and Professionalism',
          'All our domestic workers have transparent background and are well-trained '),
      Onboarding(
          'Assets/Images/onboarding3.png',
          'Give your home a Wow feeling',
          'We care about every small details to sastisfy your needs when you use our service')
    ];
    return onboardings;
  }

  @override
  Widget build(BuildContext context) {
    ///
    /// Splash Screen UI goes here.
    ///
    return Scaffold(
      backgroundColor: kprimaryColor,
      body: Center(child: Image.asset('Assets/Images/Splash_Screen_Image.png')),
    );
  }
}
