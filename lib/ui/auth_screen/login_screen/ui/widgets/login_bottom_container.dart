import 'package:bonedetect/core/helper/spacer.dart';
import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoginBottomContainer extends StatelessWidget {
  const LoginBottomContainer({
    super.key,
    required this.child,
    this.height,
    this.title,
  });

  final Widget child;

  final double? height;

  final String? title;

  @override
  Widget build(BuildContext context) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (title != null) ...[
          Text(title!, style: Textstyles.font22lightBlueextraBold()),
          verticalSpace(16),
        ],
        child, 
      ],
    );

    final box = Container(
      height: (height ?? 400.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorPalette.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 24.h),
        child: content,
      ),
    );

    return box
        .animate()
        .fadeIn(duration: 650.ms, curve: Curves.easeOutQuad)
        .slideY(begin: 0.35, end: 0, duration: 700.ms, curve: Curves.easeOutQuart);
  }
}
