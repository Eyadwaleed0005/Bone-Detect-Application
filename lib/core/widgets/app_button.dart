import 'package:bonedetect/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/widgets/app_loading_indicator.dart';

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
    this.icon,
    this.iconSpacing,
  });

  final String title;
  final VoidCallback onPressed;
  final double? height;
  final double? borderRadius;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final bool isLoading;

  final Widget? icon;
  final double? iconSpacing;

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
              : (icon == null
                    ? Text(
                        key: const ValueKey('text_only'),
                        title,
                        style: textStyle ?? Textstyles.font16whitebold(),
                      )
                    : Row(
                        key: const ValueKey('text_with_icon'),
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          icon!,
                          SizedBox(width: iconSpacing ?? 8.w),
                          Text(
                            title,
                            style: textStyle ?? Textstyles.font16whitebold(),
                          ),
                        ],
                      )),
        ),
      ),
    );
  }
}
