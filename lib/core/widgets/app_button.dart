import 'package:bonedetect/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/widgets/app_loading_indicator.dart'; // ✅ استدعاء اللودينج

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height,
    this.borderRadius,
    this.backgroundColor,
    this.textStyle,
    this.isLoading = false,
  });

  final String title;
  final VoidCallback onPressed;
  final double? height;
  final double? borderRadius;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48.h,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? ColorPalette.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          transitionBuilder: (child, animation) =>
              FadeTransition(opacity: animation, child: child),
          child: isLoading
              ? const AppLoadingIndicator(key: ValueKey('loader')) 
              : Text(
                  key: const ValueKey('text'),
                  title,
                  style: textStyle ?? Textstyles.font16whitebold(),
                ),
        ),
      ),
    );
  }
}
