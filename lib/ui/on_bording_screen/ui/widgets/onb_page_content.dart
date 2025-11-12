import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/style/textstyles.dart';
import 'package:bonedetect/core/helper/spacer.dart';

class OnbPageContent extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final bool isActive;

  const OnbPageContent({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
              width: 160.w,
              height: 160.w,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                border: Border.all(color: ColorPalette.white, width: 2.w),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Image.asset(imagePath, fit: BoxFit.contain),
            )
            .animate(target: isActive ? 1 : 0)
            .fadeIn(duration: 600.ms)
            .slideY(begin: 0.3, end: 0, duration: 600.ms),
        verticalSpace(16),
        Text(
              title,
              style: Textstyles.font25whitebold(),
              textAlign: TextAlign.center,
            )
            .animate(target: isActive ? 1 : 0)
            .fadeIn(duration: 400.ms, delay: 200.ms)
            .moveY(begin: 20, end: 0, duration: 400.ms),
        verticalSpace(12),
        Text(
              subtitle,
              style: Textstyles.font12whitemedium(),
              textAlign: TextAlign.center,
            )
            .animate(target: isActive ? 1 : 0)
            .fadeIn(duration: 400.ms, delay: 400.ms)
            .moveY(begin: 20, end: 0, duration: 400.ms),
      ],
    );
  }
}
