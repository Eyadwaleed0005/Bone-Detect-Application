import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const LanguageButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPalette.lightBlue,
          foregroundColor: ColorPalette.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          elevation: 2,
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: Textstyles.font19whiteregular(),
        ),
      ),
    );
  }
}
