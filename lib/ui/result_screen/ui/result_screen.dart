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
import 'package:easy_localization/easy_localization.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  String _getResultTitle(bool isFractured) {
    return isFractured
        ? "result_fractured_title".tr()
        : "result_not_fractured_title".tr();
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
                        verticalSpace(18),
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
                            "result_emergency_videos_title".tr(),
                            style: Textstyles.font15blackBold(),
                          ),
                          verticalSpace(12),
                          EmergencyVideoCard(
                            title: "result_emg_video1_title".tr(),
                            description: "result_emg_video1_desc".tr(),
                            imageAsset: AppImage().tmpPic1,
                            youtubeUrl:
                                "https://www.youtube.com/watch?v=2v8vlXgGXwE",
                          ),
                          EmergencyVideoCard(
                            title: "result_emg_video2_title".tr(),
                            description: "result_emg_video2_desc".tr(),
                            imageAsset: AppImage().tmpPic2,
                            youtubeUrl:
                                "https://www.youtube.com/watch?v=CP-vb0xxzFM",
                          ),
                          EmergencyVideoCard(
                            title: "result_emg_video3_title".tr(),
                            description: "result_emg_video3_desc".tr(),
                            imageAsset: AppImage().tmpPic3,
                            youtubeUrl:
                                "https://www.youtube.com/watch?v=gL2iE0wYm8w",
                          ),
                        ],

                        if (!state.isFractured) ...[
                          verticalSpace(24),
                          Text(
                            "result_bone_videos_title".tr(),
                            style: Textstyles.font15blackBold(),
                          ),
                          verticalSpace(12),
                          EmergencyVideoCard(
                            title: "result_bone_video1_title".tr(),
                            description: "result_bone_video1_desc".tr(),
                            imageAsset: AppImage().tmpPic4,
                            youtubeUrl:
                                "https://www.youtube.com/watch?v=uu3wVnKekAs",
                          ),
                          EmergencyVideoCard(
                            title: "result_bone_video2_title".tr(),
                            description: "result_bone_video2_desc".tr(),
                            imageAsset: AppImage().tmpPic5,
                            youtubeUrl:
                                "https://www.youtube.com/watch?v=y3DevSspTqw",
                          ),
                          EmergencyVideoCard(
                            title: "result_bone_video3_title".tr(),
                            description: "result_bone_video3_desc".tr(),
                            imageAsset: AppImage().tmpPic6,
                            youtubeUrl:
                                "https://www.youtube.com/watch?v=DnTyX4HGWZ8",
                          ),
                        ],

                        verticalSpace(30),
                        AppButton(
                          title: "back".tr(),
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
