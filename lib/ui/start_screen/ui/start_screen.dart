import 'package:bonedetect/core/helper/spacer.dart';
import 'package:bonedetect/core/routes/app_images_routes.dart';
import 'package:bonedetect/core/routes/route_names.dart';
import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/style/textstyles.dart';
import 'package:bonedetect/ui/start_screen/logic/cubit/start_screen_cubit.dart';
import 'package:bonedetect/ui/start_screen/ui/widget/start_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StartScreenCubit(),
      child: Builder(
        builder: (context) {
          final startCubit = context.read<StartScreenCubit>();
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
                          'AI-powered bone fracture detection',
                          style: Textstyles.font12whitebold(),
                          textAlign: TextAlign.center,
                        )
                            .animate()
                            .fadeIn(duration: 400.ms, delay: 400.ms)
                            .moveY(begin: 20, end: 0, duration: 400.ms),
                      ],
                    ),
                    StartButton(
                      onTap: () async {
                        await startCubit.markAsViewed();
                        Navigator.pushNamed(context, RouteNames.onBordingScreen);
                      },
                    )
                        .animate()
                        .fadeIn(duration: 500.ms, delay: 600.ms)
                        .slideY(begin: 0.2, end: 0, duration: 500.ms),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
