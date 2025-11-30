import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/style/fontweighthelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Textstyles {
  static const String plusJakartaSans = 'PlusJakartaSans';

  // ===== White Text =====
  static TextStyle font25whitebold() {
    return TextStyle(
      fontSize: 25.sp,
      fontWeight: FontWeightHelper.bold,
      fontFamily: plusJakartaSans,
      color: ColorPalette.white,
    );
  }
  static TextStyle font16whitebold() {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.bold,
      fontFamily: plusJakartaSans,
      color: ColorPalette.white,
    );
  }
    static TextStyle font12whitebold() {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeightHelper.bold,
      fontFamily: plusJakartaSans,
      color: ColorPalette.white,
    );
  }

  static TextStyle font12whitemedium() {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeightHelper.medium,
      fontFamily: plusJakartaSans,
      color: ColorPalette.white,
    );
  }

  static TextStyle font19whiteregular() {
    return TextStyle(
      fontSize: 19.sp,
      fontWeight: FontWeightHelper.regular,
      fontFamily: plusJakartaSans,
      color: ColorPalette.white,
    );
  }
  static TextStyle font11whiteregular() {
    return TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeightHelper.regular,
      fontFamily: plusJakartaSans,
      color: ColorPalette.white,
    );
  }

  // ===== Blue Text =====
  static TextStyle font22lightBlueextraBold() {
    return TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeightHelper.extraBold,
      fontFamily: plusJakartaSans,
      color: ColorPalette.lightBlue,
    );
  }

  static TextStyle font19lightBlueaBold() {
    return TextStyle(
      fontSize: 19.sp,
      fontWeight: FontWeightHelper.bold,
      fontFamily: plusJakartaSans,
      color: ColorPalette.lightBlue,
    );
  }

  static TextStyle font12lightBlueBold() {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeightHelper.bold,
      fontFamily: plusJakartaSans,
      color: ColorPalette.lightBlue,
    );
  }

  // ===== black =====
  static TextStyle font12blackregular() {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeightHelper.regular,
      fontFamily: plusJakartaSans,
      color: ColorPalette.black,
    );
  }

  static TextStyle font10blacksemiBold() {
    return TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeightHelper.semiBold,
      fontFamily: plusJakartaSans,
      color: ColorPalette.black,
    );
  }

  static TextStyle font15blackBold() {
    return TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeightHelper.bold,
      fontFamily: plusJakartaSans,
      color: ColorPalette.black,
    );
  }


  // ===== Gray =====
    static TextStyle font12grey600medium() {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeightHelper.medium,
      fontFamily: plusJakartaSans,
      color: ColorPalette.grey600,
    );
  }
    static TextStyle font13grey600medium() {
    return TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeightHelper.medium,
      fontFamily: plusJakartaSans,
      color: ColorPalette.grey600,
    );
  }

   static TextStyle font14grey600medium() {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.medium,
      fontFamily: plusJakartaSans,
      color: ColorPalette.grey600,
    );
  }
    static TextStyle font11grey600medium() {
    return TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeightHelper.medium,
      fontFamily: plusJakartaSans,
      color: ColorPalette.grey600,
    );
  }

  // ===== Red =====
  static TextStyle font8errorRedmedium() {
    return TextStyle(
      fontSize: 8.sp,
      fontWeight: FontWeightHelper.medium,
      fontFamily: plusJakartaSans,
      color: ColorPalette.errorRed,
    );
  }

   static TextStyle font14errorRedmedium() {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.medium,
      fontFamily: plusJakartaSans,
      color: ColorPalette.errorRed,
    );
  }
}
