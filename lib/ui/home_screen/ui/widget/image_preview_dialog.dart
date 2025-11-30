// lib/ui/home_screen/ui/widget/image_preview_dialog.dart

import 'dart:io';
import 'package:bonedetect/core/helper/spacer.dart';
import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/widgets/app_button.dart';
import 'package:bonedetect/ui/home_screen/logic/cubit/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class ImagePreviewDialog extends StatelessWidget {
  final File imageFile;
  final VoidCallback onSend;

  const ImagePreviewDialog({
    super.key,
    required this.imageFile,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
      child: Container(
        width: 230.w,
        decoration: BoxDecoration(
          color: ColorPalette.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
          builder: (context, state) {
            final bool isLoading = state is HomeScreenPredictionLoading;

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: isLoading ? null : () => Navigator.of(context).pop(),
                    child: Container(
                      width: 32.w,
                      height: 32.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorPalette.lightBlue,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.close,
                          size: 22.sp,
                          color: ColorPalette.white,
                        ),
                      ),
                    ),
                  ),
                ),

                verticalSpace(12),

                ClipRRect(
                  borderRadius: BorderRadius.circular(14.r),
                  child: Image.file(
                    imageFile,
                    width: double.infinity,
                    height: 180.h,
                    fit: BoxFit.cover,
                  ),
                ),

                verticalSpace(18),

                SizedBox(
                  width: 160.w,
                  child: AppButton(
                    title: 'send'.tr(),
                    isLoading: isLoading,
                    onPressed: () {
                      onSend();
                    },
                  ),
                ),

                verticalSpace(10),
              ],
            );
          },
        ),
      ),
    );
  }
}

Future<void> showImagePreviewDialog({
  required BuildContext context,
  required File imageFile,
  required VoidCallback onSend,
}) {
  final homeCubit = context.read<HomeScreenCubit>();

  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return BlocProvider.value(
        value: homeCubit,
        child: ImagePreviewDialog(
          imageFile: imageFile,
          onSend: onSend,
        ),
      );
    },
  );
}
