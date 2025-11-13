import 'package:bonedetect/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/helper/spacer.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.userName});
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: ColorPalette.backgroundGradient,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(22.r),
          bottomLeft: Radius.circular(22.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        child:
            Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.medical_information_outlined,
                          color: ColorPalette.white,
                          size: 22.sp,
                        ),
                        horizontalSpace(8),
                        Text(
                          'Hello, $userName',
                          style: Textstyles.font16whitebold(),
                        ),
                      ],
                    ),
                    verticalSpace(6),
                    Text(
                      'Upload your X-ray image to start analysis',
                      style: Textstyles.font11whiteregular(),
                    ),
                  ],
                )
                .animate()
                .fadeIn(duration: 500.ms, delay: 150.ms)
                .slideY(begin: -0.2, end: 0, duration: 500.ms),
      ),
    );
  }
}
