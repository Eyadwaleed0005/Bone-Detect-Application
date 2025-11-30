import 'package:bonedetect/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class NotFracturedParagraph extends StatelessWidget {
  const NotFracturedParagraph({super.key});

  @override
  Widget build(BuildContext context) {
    final baseStyle = Textstyles.font14grey600medium();
    final highlightStyle = Textstyles.font14errorRedmedium();

    return RichText(
      text: TextSpan(
        style: baseStyle,
        children: [
          TextSpan(
            text: "not_fractured_p1".tr(),
          ),
          TextSpan(
            text: "\n\n${'not_fractured_p2'.tr()}\n\n",
            style: highlightStyle,
          ),
          TextSpan(
            text: "${'not_fractured_p3'.tr()}\n\n",
          ),
          TextSpan(
            text: "not_fractured_p4".tr(),
            style: highlightStyle,
          ),
        ],
      ),
    );
  }
}
