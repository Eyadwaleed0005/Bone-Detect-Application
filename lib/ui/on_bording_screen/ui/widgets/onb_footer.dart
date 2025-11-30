import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/style/textstyles.dart';
import 'package:bonedetect/core/helper/spacer.dart';
import 'package:easy_localization/easy_localization.dart';

class OnbFooter extends StatelessWidget {
  final int currentIndex;
  final int totalPages;
  final bool isLast;
  final VoidCallback onContinue;

  const OnbFooter({
    super.key,
    required this.currentIndex,
    required this.totalPages,
    required this.isLast,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            totalPages,
            (i) => AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              width: i == currentIndex ? 18.w : 8.w,
              height: 8.w,
              decoration: BoxDecoration(
                color: ColorPalette.white.withOpacity(
                  i == currentIndex ? 1 : 0.45,
                ),
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ),
        )
            .animate()
            .fadeIn(duration: 400.ms, delay: 300.ms)
            .slideY(begin: 0.15, end: 0, duration: 400.ms),

        verticalSpace(24),

        GestureDetector(
          onTap: onContinue,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 14.h),
            decoration: BoxDecoration(
              color: ColorPalette.lightBlue,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Text(
                isLast ? 'get_started'.tr() : 'continue'.tr(),
                style: Textstyles.font19whiteregular(),
              ),
            ),
          ),
        )
            .animate()
            .fadeIn(duration: 500.ms, delay: 600.ms)
            .slideY(begin: 0.2, end: 0, duration: 500.ms),
      ],
    );
  }
}
