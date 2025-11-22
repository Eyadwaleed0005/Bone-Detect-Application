import 'package:bonedetect/core/routes/app_images_routes.dart';
import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/style/textstyles.dart';
import 'package:bonedetect/core/widgets/app_button.dart';
import 'package:bonedetect/core/helper/spacer.dart';
import 'package:bonedetect/core/widgets/app_loading_indicator.dart';
import 'package:bonedetect/ui/result_screen/logic/cubit/result_screen_cubit.dart';
import 'package:bonedetect/ui/result_screen/ui/widgets/emergency_video_card.dart';
import 'package:bonedetect/ui/result_screen/ui/widgets/fractured_paragraph.dart';
import 'package:bonedetect/ui/result_screen/ui/widgets/not_fractured_paragraph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  String _getResultTitle(bool isFractured) {
    return isFractured ? "Fracture Detected" : "No Fracture Detected";
  }

  Color _getResultColor(bool isFractured) {
    return isFractured ? ColorPalette.errorRed : ColorPalette.green;
  }

  IconData _getResultIcon(bool isFractured) {
    return isFractured
        ? Icons.warning_amber_rounded
        : Icons.check_circle_rounded;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ResultScreenCubit()..loadPrediction(),
      child: Scaffold(
        backgroundColor: ColorPalette.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: BlocBuilder<ResultScreenCubit, ResultScreenState>(
              builder: (context, state) {
                if (state is ResultScreenInitial) {
                  return const Center(child: AppLoadingIndicator());
                }

                if (state is ResultScreenLoaded) {
                  final title = _getResultTitle(state.isFractured);
                  final color = _getResultColor(state.isFractured);
                  final icon = _getResultIcon(state.isFractured);

                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(25),
                        Row(
                          children: [
                            Icon(icon, color: color, size: 30),
                            SizedBox(width: 10.w),
                            Text(
                              title,
                              style: Textstyles.font15blackBold().copyWith(
                                color: color,
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(20),
                        state.isFractured
                            ? const FracturedParagraph()
                            : const NotFracturedParagraph(),
                        if (state.isFractured) ...[
                          verticalSpace(24),
                          Text(
                            "Emergency guidance videos",
                            style: Textstyles.font15blackBold(),
                          ),
                          verticalSpace(12),
                          EmergencyVideoCard(
                            title:
                                "How to treat a fracture – basic first aid steps",
                            description:
                                "Essential first-aid actions when a fracture is suspected.",
                            imageAsset: AppImage().tmpPic1,
                            youtubeUrl:
                                "https://www.youtube.com/watch?v=2v8vlXgGXwE",
                          ),
                          EmergencyVideoCard(
                            title: "First aid for broken bones",
                            description:
                                "Learn how to immobilize broken bones safely.",
                            imageAsset: AppImage().tmpPic2,
                            youtubeUrl:
                                "https://www.youtube.com/watch?v=CP-vb0xxzFM",
                          ),
                          EmergencyVideoCard(
                            title: "Fracture help – step-by-step",
                            description:
                                "How to support an injured area until reaching care.",
                            imageAsset: AppImage().tmpPic3,
                            youtubeUrl:
                                "https://www.youtube.com/watch?v=gL2iE0wYm8w",
                          ),
                        ],
                        if (!state.isFractured) ...[
                          verticalSpace(24),
                          Text(
                            "Bone Strengthening Videos",
                            style: Textstyles.font15blackBold(),
                          ),
                          verticalSpace(12),
                          EmergencyVideoCard(
                            title: "Top foods to strengthen your bones",
                            description:
                                "Learn which foods naturally boost bone density.",
                            imageAsset: AppImage().tmpPic4,
                            youtubeUrl:
                                "https://www.youtube.com/watch?v=zP7wnkGdb5I",
                          ),
                          EmergencyVideoCard(
                            title: "Exercises to improve bone health",
                            description:
                                "Daily exercises that help keep your bones strong.",
                            imageAsset: AppImage().tmpPic5,
                            youtubeUrl:
                                "https://www.youtube.com/watch?v=fyQJv1EK5n8",
                          ),
                          EmergencyVideoCard(
                            title: "Vitamin D & calcium explained",
                            description:
                                "The best ways to naturally increase vitamin D and calcium.",
                            imageAsset: AppImage().tmpPic6,
                            youtubeUrl:
                                "https://www.youtube.com/watch?v=K7rHGz2XaAg",
                          ),
                        ],
                        verticalSpace(30),
                        AppButton(
                          title: "Back",
                          onPressed: () => Navigator.pop(context),
                        ),
                        verticalSpace(20),
                      ],
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
