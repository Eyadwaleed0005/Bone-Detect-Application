import 'package:bonedetect/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionsDotsIndicator extends StatelessWidget {
  const QuestionsDotsIndicator({
    super.key,
    required this.length,
    required this.currentIndex,
  });

  final int length;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          width: currentIndex == index ? 10.w : 6.w,
          height: currentIndex == index ? 10.w : 6.w,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? ColorPalette.lightBlue
                : ColorPalette.grey300,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
