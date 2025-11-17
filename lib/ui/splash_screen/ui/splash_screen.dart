import 'package:bonedetect/core/helper/spacer.dart';
import 'package:bonedetect/core/routes/app_images_routes.dart';
import 'package:bonedetect/core/routes/route_names.dart';
import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/style/textstyles.dart';
import 'package:bonedetect/ui/splash_screen/logic/cubit/splash_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashScreenCubit()..checkToken(),
      child: BlocListener<SplashScreenCubit, SplashScreenState>(
        listener: (context, state) {
          if (state is SplashShowStartScreen) {
            Navigator.pushReplacementNamed(context, RouteNames.startScreen);
          } else if (state is SplashScreenHasToken) {
            Navigator.pushReplacementNamed(context, RouteNames.homeScreen);
          } else if (state is SplashScreenNoToken) {
            Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
          }
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: const BoxDecoration(
              gradient: ColorPalette.backgroundGradient,
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 100.w,
                    height: 100.w,
                    padding: EdgeInsets.all(14.w),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorPalette.white,
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Image.asset(AppImage().bone),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: 0.3, end: 0, duration: 600.ms),

                  verticalSpace(16),

                  Text(
                    'Bone Detect',
                    style: Textstyles.font25whitebold(),
                    textAlign: TextAlign.center,
                  )
                      .animate()
                      .fadeIn(duration: 400.ms, delay: 200.ms)
                      .moveY(begin: 20, end: 0, duration: 400.ms),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
