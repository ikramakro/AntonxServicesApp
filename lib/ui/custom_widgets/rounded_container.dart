// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundedContainer extends StatelessWidget {
  Widget child;
  double height;
  double width;
  Color? color;
  double? radus;
  VoidCallback? ontap;
  RoundedContainer(
      {Key? key,
      required this.child,
      required this.height,
      required this.width,
      this.color,
      this.radus,
      this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(radus ?? 20),
                bottomRight: Radius.circular(radus ?? 20),
                topRight: Radius.circular(radus ?? 20)),
            border: Border.all(color: const Color(0xffEAEAFF))),
        child: child,
      ),
    );
  }
}
