import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:bonedetect/core/style/textstyles.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onTap;

  const SkipButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          'Skip',
          style: Textstyles.font12whitemedium(),
        )
            .animate()
            .fadeIn(duration: 300.ms)
            .slideY(begin: -0.1, end: 0, duration: 300.ms),
      ),
    );
  }
}
