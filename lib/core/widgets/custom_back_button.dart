import 'package:bonedetect/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onTap;

  const CustomBackButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10.h,
      left: 16.w,
      child: SafeArea(
        child: GestureDetector(
          onTap: onTap ?? () => Navigator.pop(context),
          child: Container(
            width: 34.r,
            height: 34.r,
            decoration: BoxDecoration(
              color: ColorPalette.white.withOpacity(0.9),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: ColorPalette.black.withOpacity(0.08),
                  blurRadius: 6.r,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              Icons.arrow_back,
              color: ColorPalette.lightBlue,
              size: 18.sp,
            ),
          ),
        ),
      ),
    );
  }
}
