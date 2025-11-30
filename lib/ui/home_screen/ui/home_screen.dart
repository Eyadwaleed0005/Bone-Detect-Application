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
import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeScreenCubit()..loadUserName(),
      child: BlocListener<HomeScreenCubit, HomeScreenState>(
        listener: (context, state) async {
          if (state is HomeScreenLanguageChanged) {
            await context.setLocale(state.newLocale);
          }

          if (state is HomeScreenShowPreview) {
            await showImagePreviewDialog(
              context: context,
              imageFile: state.imageFile,
              onSend: () {
                context.read<HomeScreenCubit>().sendImageForPrediction(
                  state.imageFile,
                );
              },
            );
          }

          if (state is HomeScreenPredictionSuccess) {
            final cubit = context.read<HomeScreenCubit>();
            final File? imageFile = cubit.lastImageFile;
            Navigator.of(context, rootNavigator: true).pop();

            if (imageFile != null) {
              Navigator.pushNamed(
                context,
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

          if (state is HomeScreenLogoutSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteNames.loginScreen,
              (route) => false,
            );
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Container(color: ColorPalette.white),
                BlocBuilder<HomeScreenCubit, HomeScreenState>(
                  builder: (context, state) {
                    final cubit = context.read<HomeScreenCubit>();
                    String userName = cubit.userName;
                    if (state is HomeScreenLoaded) {
                      userName = state.userName;
                    }
                    return HomeHeader(
                      userName: userName,
                      onLogout: () {
                        context.read<HomeScreenCubit>().logout();
                      },
                    );
                  },
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
                      builder: (context, state) {
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              verticalSpace(80),
                              Text(
                                    "home_upload_xray".tr(),
                                    style: Textstyles.font13grey600medium(),
                                  )
                                  .animate()
                                  .fadeIn(duration: 400.ms, delay: 200.ms)
                                  .moveY(begin: 10, end: 0, duration: 400.ms),
                              verticalSpace(25),
                              AppButton(
                                    title: 'home_take_photo'.tr(),
                                    icon: Icon(
                                      Icons.camera_alt_outlined,
                                      color: ColorPalette.white,
                                      size: 15.sp,
                                    ),
                                    onPressed: () {
                                      context
                                          .read<HomeScreenCubit>()
                                          .pickFromCamera();
                                    },
                                  )
                                  .animate()
                                  .fadeIn(duration: 400.ms, delay: 350.ms)
                                  .moveY(begin: 20, end: 0, duration: 400.ms),
                              verticalSpace(14),
                              OrDivider(),
                              verticalSpace(14),
                              AppButton(
                                    title: 'home_choose_gallery'.tr(),
                                    icon: Icon(
                                      Icons.photo_library_outlined,
                                      color: ColorPalette.white,
                                      size: 15.sp,
                                    ),
                                    onPressed: () {
                                      context
                                          .read<HomeScreenCubit>()
                                          .pickFromGallery();
                                    },
                                  )
                                  .animate()
                                  .fadeIn(duration: 400.ms, delay: 650.ms)
                                  .moveY(begin: 20, end: 0, duration: 400.ms),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
