// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/core/services/database_service.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_biner.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_appbar.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_container.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/image_container.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/rounded_container.dart';

import 'package:flutter_antonx_boilerplate/ui/screens/home_screens/home_screen_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  DatabaseService firebaseService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenViewModal(),
      child: Consumer<HomeScreenViewModal>(
        builder: (context, modal, child) {
          return Scaffold(
            backgroundColor: kwhitecolor,
            body: Column(
              children: [
                customAppBar(modal),
                body(modal),
              ],
            ),
          );
        },
      ),
    );
  }

  customAppBar(HomeScreenViewModal modal) {
    return Stack(
      children: [
        const CustomAppBar(),
        Padding(
          padding:
              const EdgeInsets.only(right: 32, left: 34, top: 40, bottom: 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi ${modal.username}",
                        style: kHead,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text("Need some help today?", style: kHead11),
                    ],
                  ),
                  ImageContainer(
                    assets: "Assets/Images/menu_icon.png",
                    height: 47.h,
                    width: 47.w,
                    fit: BoxFit.contain,
                    // color: Colors.amber,
                  )
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 34.h),
                child: CustomContainer(
                  child: Column(children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Find it here",
                          border: InputBorder.none),
                    )
                  ]),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  PageController controller = PageController();

  body(HomeScreenViewModal model) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
                height: 250.h,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 160,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 120),
                  itemCount: model.allCategory.length,
                  itemBuilder: (context, index) {
                    return RoundedContainer(
                        height: 0.h,
                        width: 0.w,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 32.h,
                                  width: 32.w,
                                  child: Image.network(
                                      model.allCategory[index].icon!)),
                              Padding(
                                padding: EdgeInsets.only(top: 15.h),
                                child: Text(model.allCategory[index].name!),
                              )
                            ],
                          ),
                        ));
                  },
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Text(
                'Top pick',
                style: kHead6,
              ),
            ),
            Row(
              children: [
                RoundedContainer(
                  height: 274.h,
                  width: 180,
                  ontap: () {
                    // Get.to(() => const ServicesDetailScreen());
                  },
                  color: kcontainerbg,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 35),
                    child: Column(
                      children: [
                        Image.asset('Assets/Images/Rectangle 15.png'),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'Full house Cleaning',
                          style: kHead7,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      RoundedContainer(
                        height: 127.h,
                        width: 145.w,
                        color: kwhitecolor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 35),
                          child: Column(
                            children: [
                              Image.asset('Assets/Images/PLUMBING.png'),
                              SizedBox(
                                height: 11.h,
                              ),
                              Text('Plumbing', style: kHead8),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      RoundedContainer(
                        height: 127.h,
                        width: 145.w,
                        color: kcontainerbg,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 35),
                          child: Column(
                            children: [
                              Image.asset('Assets/Images/Cooking.png'),
                              SizedBox(
                                height: 11.h,
                              ),
                              Text(
                                'Cooking',
                                style: kHead8,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: 420.w,
              height: 170.h,
              child: PageView(
                controller: controller,
                physics: const BouncingScrollPhysics(),
                children: [
                  CustomBiner(image: 'Assets/Images/Slider img (2).png'),
                  CustomBiner(image: 'Assets/Images/Slider img.png'),
                  CustomBiner(image: 'Assets/Images/Slider img.png')
                ],
              ),
            ),
            Center(
              child: SmoothPageIndicator(
                  controller: controller, // PageController
                  count: 3,
                  effect: WormEffect(
                      dotHeight: 10.h, dotWidth: 10.w), // your preferred effect
                  onDotClicked: (index) {}),
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              'Explore',
              style: kHead6,
            ),
            SizedBox(
              height: 130.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  RoundedContainer(
                    height: 160.h,
                    width: 122.w,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 25, right: 25),
                      child: Column(
                        children: [
                          Image.asset('Assets/Images/Bathroom.png'),
                          SizedBox(
                            height: 11.h,
                          ),
                          Text('Bathroom Cleaning', style: kHead8),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.h,
                  ),
                  RoundedContainer(
                    height: 160.h,
                    width: 122.w,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 25, right: 25),
                      child: Column(
                        children: [
                          Image.asset('Assets/Images/Groceries.png'),
                          SizedBox(
                            height: 11.h,
                          ),
                          Text(
                            'Groceries Shopping',
                            style: kHead8,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.h,
                  ),
                  RoundedContainer(
                    height: 160.h,
                    width: 122.w,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 25, right: 25),
                      child: Column(
                        children: [
                          Image.asset('Assets/Images/PLUMBING.png'),
                          SizedBox(
                            height: 11.h,
                          ),
                          Text(
                            'Sofa Wash',
                            style: kHead8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 28.h,
            ),
            Container(
              height: 50,
              width: 120.w,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 11.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14), color: kwhitecolor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add_circle_outline,
                    color: kprimaryColor,
                    size: 20,
                  ),
                  Text(
                    " Need more service?",
                    style: kHead4,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
