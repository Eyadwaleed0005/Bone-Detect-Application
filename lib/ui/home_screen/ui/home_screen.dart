import 'package:bonedetect/core/routes/route_names.dart';
import 'package:bonedetect/ui/home_screen/ui/widget/home_header.dart';
import 'package:bonedetect/ui/home_screen/ui/widget/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/widgets/app_button.dart';
import 'package:bonedetect/core/helper/spacer.dart';
import 'package:bonedetect/core/style/textstyles.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: ColorPalette.white),
          const HomeHeader(userName: "Eyad"),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    verticalSpace(80),
                    Text(
                          "Please upload your X-ray image",
                          style: Textstyles.font13grey600medium(),
                        )
                        .animate()
                        .fadeIn(duration: 400.ms, delay: 200.ms)
                        .moveY(begin: 10, end: 0, duration: 400.ms),
                    verticalSpace(25),
                    AppButton(
                          title: 'Take a photo',
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: ColorPalette.white,
                            size: 15.sp,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RouteNames.questionScreen,
                            );
                          },
                        )
                        .animate()
                        .fadeIn(duration: 400.ms, delay: 350.ms)
                        .moveY(begin: 20, end: 0, duration: 400.ms),
                    verticalSpace(14),
                    const OrDivider(),
                    verticalSpace(14),
                    AppButton(
                          title: 'Choose from gallery',
                          icon: Icon(
                            Icons.photo_library_outlined,
                            color: ColorPalette.white,
                            size: 15.sp,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RouteNames.questionScreen,
                            );
                          },
                        )
                        .animate()
                        .fadeIn(duration: 400.ms, delay: 650.ms)
                        .moveY(begin: 20, end: 0, duration: 400.ms),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
