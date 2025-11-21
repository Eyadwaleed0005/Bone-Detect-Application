import 'dart:io';
import 'package:bonedetect/core/routes/app_images_routes.dart';
import 'package:bonedetect/core/routes/route_names.dart';
import 'package:bonedetect/core/widgets/animation_box.dart';
import 'package:bonedetect/ui/home_screen/logic/cubit/home_screen_cubit.dart';
import 'package:bonedetect/ui/home_screen/ui/widget/home_header.dart';
import 'package:bonedetect/ui/home_screen/ui/widget/or_divider.dart';
import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/widgets/app_button.dart';
import 'package:bonedetect/core/helper/spacer.dart';
import 'package:bonedetect/core/style/textstyles.dart';
import 'package:bonedetect/ui/home_screen/ui/widget/image_preview_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeScreenCubit()..loadUserName(),
      child: Builder(
        builder: (innerContext) {
          return BlocListener<HomeScreenCubit, HomeScreenState>(
            listener: (innerContext, state) async {
              if (state is HomeScreenShowPreview) {
                await showImagePreviewDialog(
                  context: innerContext,
                  imageFile: state.imageFile,
                  onSend: () {
                    innerContext.read<HomeScreenCubit>().sendImageForPrediction(
                      state.imageFile,
                    );
                  },
                );
              }
              if (state is HomeScreenPredictionSuccess) {
                final cubit = innerContext.read<HomeScreenCubit>();
                final File? imageFile = cubit.lastImageFile;
                Navigator.of(innerContext, rootNavigator: true).pop();
                if (imageFile != null) {
                  Navigator.pushNamed(
                    innerContext,
                    RouteNames.questionScreen,
                    arguments: imageFile,
                  );
                }
              }
              if (state is HomeScreenPredictionError) {
                showBlockingAnimation(
                  context: context,
                  message: state.message,
                  animationAsset: AppImage().errorAnimation,
                  autoClose: true,
                  duration: const Duration(seconds: 3),
                  textStyle: Textstyles.font16whitebold(),
                );
              }
            },
            child: Scaffold(
              body: BlocBuilder<HomeScreenCubit, HomeScreenState>(
                builder: (innerContext, state) {
                  final cubit = innerContext.read<HomeScreenCubit>();
                  final userName = cubit.userName;

                  return Stack(
                    children: [
                      Container(color: ColorPalette.white),
                      HomeHeader(userName: userName),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                verticalSpace(80),
                                Text(
                                      "Please upload your X-ray image",
                                      style: Textstyles.font13grey600medium(),
                                    )
                                    .animate()
                                    .fadeIn(duration: 400.ms, delay: 200.ms)
                                    .moveY(begin: 10, end: 0, duration: 400.ms),
                                verticalSpace(25),
                                AppButton(
                                      title: 'Take a photo',
                                      icon: Icon(
                                        Icons.camera_alt_outlined,
                                        color: ColorPalette.white,
                                        size: 15.sp,
                                      ),
                                      onPressed: () {
                                        innerContext
                                            .read<HomeScreenCubit>()
                                            .pickFromCamera();
                                      },
                                    )
                                    .animate()
                                    .fadeIn(duration: 400.ms, delay: 350.ms)
                                    .moveY(begin: 20, end: 0, duration: 400.ms),
                                verticalSpace(14),
                                const OrDivider(),
                                verticalSpace(14),
                                AppButton(
                                      title: 'Choose from gallery',
                                      icon: Icon(
                                        Icons.photo_library_outlined,
                                        color: ColorPalette.white,
                                        size: 15.sp,
                                      ),
                                      onPressed: () {
                                        innerContext
                                            .read<HomeScreenCubit>()
                                            .pickFromGallery();
                                      },
                                    )
                                    .animate()
                                    .fadeIn(duration: 400.ms, delay: 650.ms)
                                    .moveY(begin: 20, end: 0, duration: 400.ms),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
