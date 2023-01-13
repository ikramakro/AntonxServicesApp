import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/core/others/base_view_model.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/auth_signup/login/login_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/auth_signup/sign_up/sign_up_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/booking_screen/booking_againScreen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/booking_screen/booking_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/booking_screen/completed_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/booking_screen/tabs/active_Tab.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/booking_screen/tabs/cancelled_Tab.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/booking_screen/tabs/completed_Tab.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/home_screens/home_screen.dart';

class RootScreenViewModel extends BaseViewModel {
  List<Widget> allScreen = [
    HomeScreen(),
    BookingScreen(),
    CompletedScreen(),
    CancelledTab()
  ];
  int selectedScreen = 0;

  bool isEnableBottomBar = true;

  updatedScreenIndex(int index) {
    setState(ViewState.busy);
    selectedScreen = index;
    setState(ViewState.idle);
  }

  updateBottomBarStatus(bool val) {
    isEnableBottomBar = val;
    notifyListeners();
  }
}
