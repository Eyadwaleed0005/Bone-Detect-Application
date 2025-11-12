import 'package:bonedetect/core/style/textstyles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    super.key,
    required this.onTap,
    this.questionText = "Already have an account? ",
    this.actionText = "Login",
    this.alignment = Alignment.center,
    this.padding,
  });

  final VoidCallback onTap;
  final String questionText;
  final String actionText;
  final Alignment alignment;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: padding ?? EdgeInsets.symmetric(vertical: 4.h),
        child: RichText(
          text: TextSpan(
            style: Textstyles.font12blackregular(),
            children: [
              TextSpan(text: questionText),
              TextSpan(
                text: actionText,
                style: Textstyles.font12lightBlueBold(),
                recognizer: TapGestureRecognizer()..onTap = onTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
