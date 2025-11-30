import 'package:bonedetect/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:easy_localization/easy_localization.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(thickness: 1.sp)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            'or'.tr(),
            style: Textstyles.font11grey600medium(),
          ),
        ),
        Expanded(child: Divider(thickness: 1.sp)),
      ],
    )
        .animate()
        .fadeIn(duration: 400.ms)
        .moveY(begin: 10, end: 0, duration: 400.ms);
  }
}
