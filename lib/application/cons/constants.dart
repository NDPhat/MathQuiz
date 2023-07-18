import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

const kColorizeAnimationColors = [
  Colors.lightGreenAccent,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.cyanAccent,
];

const kGradientColors = [Color(0xff1542bf), Color(0xff51a8ff)];

const kAnimationTextStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.bold,
  fontFamily: 'Lobster',
);

const kTimerTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 36,
  fontFamily: 'Lobster',
);

const KTapToStartTextStyle = TextStyle(fontSize: 25, color: Colors.white);

const kScoreLabelTextStyle = TextStyle(
  fontSize: 28,
  color: Colors.orangeAccent,
  fontFamily: 'Press_Start_2P',
);

const kScoreIndicatorTextStyle = TextStyle(
  fontSize: 42,
  color: Colors.black,
  fontFamily: 'Chakra_Petch',
  fontWeight: FontWeight.bold,
);

const kQuizTextStyle = TextStyle(
  fontSize: 30,
  color: Colors.white60,
  fontWeight: FontWeight.bold,
);

const kButtonTextStyle = TextStyle(
  fontSize: 40,
  fontFamily: 'Press_Start_2P',
);

const kTitleTS = TextStyle(
  fontSize: 32,
  color: Colors.orangeAccent,
  fontFamily: 'Press_Start_2P',
);
const kTitleTSSmall = TextStyle(
  fontSize: 15,
  color: Colors.white,
  fontFamily: 'Press_Start_2P',
);
const kTitleTSReadyDL = TextStyle(
  fontSize: 20,
  color: Colors.orangeAccent,
  fontFamily: 'Press_Start_2P',
);
const kTitleTSBold = TextStyle(
    fontSize: 44,
    color: Colors.blueAccent,
    fontFamily: 'Press_Start_2P',
    fontWeight: FontWeight.bold);
const kTitleTSBold1 = TextStyle(
    fontSize: 44,
    color: Colors.orangeAccent,
    fontFamily: 'Press_Start_2P',
    fontWeight: FontWeight.bold);
const kTitleTSBold2 = TextStyle(
    fontSize: 44,
    color: Colors.redAccent,
    fontFamily: 'Press_Start_2P',
    fontWeight: FontWeight.bold);

const kContentTS = TextStyle(
  fontSize: 24,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

const kDialogButtonsTS = TextStyle(
  fontSize: 18,
  color: Colors.white60,
);


//colors
const Color kPrimaryColor = Color(0xFF345FB4);
const Color kSecondaryColor = Color(0xFF6789CA);
const Color kTextBlackColor = Color(0xFF313131);
const Color kTextWhiteColor = Color(0xFFFFFFFF);
const Color kContainerColor = Color(0xFF777777);
const Color kOtherColor = Color(0xFFF4F6F7);
const Color kTextLightColor = Color(0xFFA5A5A5);
const Color kErrorBorderColor = Color(0xFFE74C3C);

//default value
const kDefaultPadding = 20.0;

const sizedBox = SizedBox(
  height: kDefaultPadding,
);
const kWidthSizedBox = SizedBox(
  width: kDefaultPadding,
);

const kHalfSizedBox = SizedBox(
  height: kDefaultPadding / 2,
);

const kHalfWidthSizedBox = SizedBox(
  width: kDefaultPadding / 2,
);

const kTopBorderRadius = BorderRadius.only(
  topLeft: Radius.circular(20),
  topRight:
  Radius.circular(20),
);

final kBottomBorderRadius = BorderRadius.only(
  bottomRight: Radius.circular(SizerUtil.deviceType == DeviceType.tablet ? 40 : 20),
  bottomLeft:
  Radius.circular(SizerUtil.deviceType == DeviceType.tablet ? 40 : 20),
);

final kInputTextStyle = GoogleFonts.poppins(
    color: kTextBlackColor,
    fontSize: 11.sp,
    fontWeight: FontWeight.w500
);

//validation for mobile
const String mobilePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

//validation for email
const String emailPattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
