// lib/ui/language_screen/ui/language_screen.dart

import 'package:bonedetect/core/helper/spacer.dart';
import 'package:bonedetect/core/routes/app_images_routes.dart';
import 'package:bonedetect/core/routes/route_names.dart';
import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/style/textstyles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'widget/language_button.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: ColorPalette.backgroundGradient,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 90.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 80.w,
                    height: 80.w,
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorPalette.white,
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Image.asset(AppImage().bone),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: 0.3, end: 0, duration: 600.ms),
                  verticalSpace(12),
                  Text(
                    'Bone Detect',
                    style: Textstyles.font25whitebold(),
                  )
                      .animate()
                      .fadeIn(duration: 400.ms, delay: 200.ms)
                      .moveY(begin: 20, end: 0, duration: 400.ms),
                  verticalSpace(12),
                  Text(
                    'Choose your preferred language',
                    style: Textstyles.font12whitebold(),
                    textAlign: TextAlign.center,
                  )
                      .animate()
                      .fadeIn(duration: 400.ms, delay: 400.ms)
                      .moveY(begin: 20, end: 0, duration: 400.ms),
                ],
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LanguageButton(
                    label: 'English',
                    onTap: () async {
                      await context.setLocale(const Locale('en'));
                      Navigator.pushReplacementNamed(context, RouteNames.onBordingScreen);
                    },
                  ),
                  verticalSpace(12),
                  LanguageButton(
                    label: 'العربية',
                    onTap: () async {
                      await context.setLocale(const Locale('ar'));
                      Navigator.pushReplacementNamed(context, RouteNames.onBordingScreen);
                    },
                  ),
                ],
              )
                  .animate()
                  .fadeIn(duration: 500.ms, delay: 600.ms)
                  .slideY(begin: 0.2, end: 0, duration: 500.ms),
            ],
          ),
        ),
      ),
    );
  }
}
