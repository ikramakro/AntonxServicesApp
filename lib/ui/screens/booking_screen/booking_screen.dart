import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_row.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/booking_screen/tabs/active_Tab.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/booking_screen/tabs/cancelled_Tab.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/booking_screen/tabs/completed_Tab.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          // ignore: prefer_const_literals_to_create_immutables
          body: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(children: [
              CustomRow(text: 'Booking'),
              const TabBar(
                  labelColor: kblackcolor,
                  unselectedLabelColor: kblackcolor3,
                  indicatorColor: kprimaryColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      child: Text(
                        'Active',
                        style: kHead19,
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Completed',
                        style: kHead19,
                      ),
                      // text: 'Completed',
                    ),
                    Tab(
                      child: Text(
                        'Cancelled',
                        style: kHead19,
                      ),
                    ),
                  ]),
              const Expanded(
                child: TabBarView(children: [
                  ActiveTab(),
                  CompletedTab(),
                  CancelledTab(),
                ]),
              )
            ]),
          ),
        ));
  }
}
