import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final kHead1 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 28.sp,
);
const smallTax = TextStyle(
  letterSpacing: sqrt1_2,
  wordSpacing: sqrt1_2,
  color: Colors.grey,
);
final kHead2 = TextStyle(
  color: kbtnTxtColor,
  fontSize: 24.h,
  fontWeight: FontWeight.w600,
);

final kHead3 = TextStyle(
    color: kbtnTxtColor,
    fontSize: ScreenUtil().setSp(16),
    fontWeight: FontWeight.bold);
final kHead4 = TextStyle(
    color: kprimaryColor,
    fontSize: ScreenUtil().setSp(16),
    fontWeight: FontWeight.bold);
final kHead5 = TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(16));
