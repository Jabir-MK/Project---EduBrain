import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

const Color jPrimaryColor = Color(0xFF345FB4);
const Color jSecondaryColor = Color(0xFF6789CA);
const Color jBlackTextColor = Color(0xFF313131);
const Color jWhiteTextColor = Color(0xFFFFFFFF);
const Color jContainerColor = Color(0xFF777777);
const Color jOtherColor = Color(0xFFF4F6F7);
const Color jLightTextColor = Color(0xFFA5A5A5);
const Color jErrorBorderColor = Color(0xFFE74C3C);
const Color jAppBarBackgroundColor = Color.fromARGB(255, 89, 0, 255);

const jDefaultPadding = 20.0;

const jheightBox = SizedBox(
  height: jDefaultPadding,
);
const jWidthBox = SizedBox(
  width: jDefaultPadding,
);

const jHalfHeightBox = SizedBox(
  height: jDefaultPadding / 2,
);
const jLargeSizedHeightBox = SizedBox(
  height: jDefaultPadding * 4,
);
const jHalfWidthBox = SizedBox(
  width: jDefaultPadding / 2,
);

const jDefaultDivider = Divider(
  height: 5,
  thickness: 1,
);
const jColoredDivider = Divider(
  color: jPrimaryColor,
  height: 5,
  thickness: 1,
  indent: 5,
  endIndent: 5,
);

const jTwiceThickDivider = Divider(
  color: jPrimaryColor,
  thickness: 2,
);

const jThriceThickDivider = Divider(
  thickness: 3,
  color: jPrimaryColor,
);

final jTopBorderRadius = BorderRadius.only(
  topLeft: Radius.circular(SizerUtil.deviceType == DeviceType.tablet ? 40 : 20),
  topRight:
      Radius.circular(SizerUtil.deviceType == DeviceType.tablet ? 40 : 20),
);

final jBottomBorderRadius = BorderRadius.only(
  bottomRight:
      Radius.circular(SizerUtil.deviceType == DeviceType.tablet ? 40 : 20),
  bottomLeft:
      Radius.circular(SizerUtil.deviceType == DeviceType.tablet ? 40 : 20),
);

final jInputTextStyle = GoogleFonts.poppins(
  color: jBlackTextColor,
  fontSize: 11.sp,
  fontWeight: FontWeight.w500,
);

const String mobilePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

const String emailPattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
