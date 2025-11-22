import 'package:bonedetect/core/style/textstyles.dart';
import 'package:flutter/material.dart';

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
          const TextSpan(
            text:
                "The AI analysis does not detect any bone fracture in the uploaded image.\n\n",
          ),
          TextSpan(
            text:
                "If the image is not an actual medical X-ray (e.g., a normal camera photo), the model will also classify it as 'no fracture'.\n",
            style: highlightStyle,
          ),
          const TextSpan(
            text:
                "Please make sure you upload a proper medical X-ray for accurate results.\n\n",
          ),
          TextSpan(
            text:
                "If you still feel pain or symptoms, it is recommended to consult a medical specialist.",
            style: highlightStyle,
          ),
        ],
      ),
    );
  }
}
