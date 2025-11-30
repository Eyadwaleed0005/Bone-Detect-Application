import 'package:bonedetect/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class FracturedParagraph extends StatelessWidget {
  const FracturedParagraph({super.key});

  @override
  Widget build(BuildContext context) {
    final baseStyle = Textstyles.font14grey600medium();
    final highlightStyle = Textstyles.font14errorRedmedium();

    return RichText(
      text: TextSpan(
        style: baseStyle,
        children: [
          TextSpan(
            text: "fracture_p1".tr(),
          ),
          TextSpan(
            text: "\n\n${'fracture_p2'.tr()}\n\n",
          ),
          TextSpan(
            text: "fracture_warning".tr(),
            style: highlightStyle,
          ),
        ],
      ),
    );
  }
}
