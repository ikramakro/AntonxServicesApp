import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/bottom_nav_bar/fab_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/image_container.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/root/root_screen_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RootScreenViewModel(),
      child: Consumer<RootScreenViewModel>(
        builder: (context, model, child) => WillPopScope(
          onWillPop: () async {
            final status = await Get.dialog(AlertDialog(
              title: const Text('Caution!'),
              content:
                  const Text('Do you really want to close the application?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Get.back(result: true);
                  },
                  child: const Text('Yes'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back(result: false);
                  },
                  child: const Text('No'),
                ),
              ],
            ));

            /// In case user has chosen not to be kept logged in,
            /// he will get logged out of the app on exit.
            // if (status && !locator<AuthService>().isRememberMe) {
            //   await locator<AuthService>().logout();
            // }
            return status;
          },
          child: Scaffold(
              extendBody: true,
              body: model.allScreen[model.selectedScreen],
              bottomNavigationBar:
                  // model.isEnableBottomBar
                  //     ?
                  FABBottomAppBar(
                color: Colors.white,
                backgroundColor: Colors.white,
                selectedColor: kprimaryColor,

                // notchedShape: const CircularNotchedRectangle(),
                onTabSelected: model.updatedScreenIndex,
                items: [
                  FABBottomAppBarItem(
                    icon: ImageContainer(
                      height: 20.h,
                      width: 20.h,
                      assets: model.selectedScreen == 0
                          ? "Assets/Images/home_selected_icon.png"
                          : "Assets/Images/home_unselected_icon.png",
                      fit: BoxFit.contain,
                    ),
                    text: "Home",
                  ),
                  FABBottomAppBarItem(
                      icon: ImageContainer(
                        height: 20.h,
                        width: 20.h,
                        assets: model.selectedScreen == 1
                            ? "${staticAssetsPath}booking_selected_icon.png"
                            : "${staticAssetsPath}booking_unselected_icon.png",
                        fit: BoxFit.contain,
                      ),
                      text: "Booking"),
                  FABBottomAppBarItem(
                      icon: ImageContainer(
                        height: 20.h,
                        width: 20.h,
                        assets: model.selectedScreen == 2
                            ? "${staticAssetsPath}chat_selected_icon.png"
                            : "${staticAssetsPath}chat_unselected_icon.png",
                        fit: BoxFit.contain,
                      ),
                      text: "Chat"),
                  FABBottomAppBarItem(
                    icon: ImageContainer(
                      height: 20.h,
                      width: 20.h,
                      assets: model.selectedScreen == 3
                          ? "${staticAssetsPath}notification_selected_icon.png"
                          : "${staticAssetsPath}notification_unselected_icon.png",
                      fit: BoxFit.contain,
                    ),
                    text: "Notification",
                  ),
                ],
              )

              // : Container(),
//      body: _list[_page],
              // floatingActionButtonLocation:
              //     FloatingActionButtonLocation.centerDocked,
              // floatingActionButton: model.isEnableBottomBar
              //     ? FloatingActionButton(
              //         backgroundColor: otherColor,
              //         onPressed: () {},
              //         child: const Icon(Icons.add),
              //         elevation: 2.0,
              //       )
              //     : Container(),
              ),
        ),
      ),
    );
  }
}
