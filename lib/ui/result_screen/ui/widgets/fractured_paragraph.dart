import 'package:bonedetect/core/style/textstyles.dart';
import 'package:flutter/material.dart';

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
          const TextSpan(
            text:
                "The AI analysis indicates a potential bone fracture.\n\n"
                "There is a strong possibility of a fracture based on the model analysis.\n\n",
          ),
          TextSpan(
            text:
                "Please consult a medical specialist as soon as possible to confirm the diagnosis and begin appropriate treatment.",
            style: highlightStyle,
          ),
        ],
      ),
    );
  }
}
