import 'package:bonedetect/core/routes/route_names.dart';
import 'package:bonedetect/ui/on_bording_screen/logic/cubit/on_bording_screen_cubit.dart';
import 'package:bonedetect/ui/on_bording_screen/logic/cubit/on_bording_screen_state.dart';
import 'package:bonedetect/ui/on_bording_screen/ui/widgets/skip_button.dart';
import 'package:bonedetect/ui/on_bording_screen/ui/widgets/onb_footer.dart';
import 'package:bonedetect/ui/on_bording_screen/ui/widgets/onb_page_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/routes/app_images_routes.dart';
import 'package:easy_localization/easy_localization.dart';

class OnBordingScreen extends StatelessWidget {
  const OnBordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnBordingScreenCubit(),
      child: const _OnBordingView(),
    );
  }
}

class _OnBordingView extends StatelessWidget {
  const _OnBordingView();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBordingScreenCubit>();
    return BlocListener<OnBordingScreenCubit, OnBordingScreenState>(
      listenWhen: (prev, curr) => prev.action != curr.action,
      listener: (context, state) {
        if (state.action == OnbAction.navigateLogin) {
          Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            gradient: ColorPalette.backgroundGradient,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SkipButton(onTap: () => cubit.onSkip(context)),
                Expanded(
                  child: BlocBuilder<OnBordingScreenCubit, OnBordingScreenState>(
                    buildWhen: (p, c) => p.index != c.index,
                    builder: (context, state) {
                      return PageView.builder(
                        controller: cubit.controller,
                        itemCount: cubit.pages.length,
                        onPageChanged: cubit.onPageChanged,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (_, i) {
                          final p = cubit.pages[i];
                          final imagePath =
                              p['image'] == null ? AppImage().bone : p['image']!;
                          return OnbPageContent(
                            imagePath: imagePath,
                            title: p['title']!.tr(),
                            subtitle: p['subtitle']!.tr(),
                            isActive: state.index == i,
                          );
                        },
                      );
                    },
                  ),
                ),
                BlocBuilder<OnBordingScreenCubit, OnBordingScreenState>(
                  buildWhen: (p, c) => p.index != c.index,
                  builder: (context, state) {
                    return OnbFooter(
                      currentIndex: state.index,
                      totalPages: cubit.pages.length,
                      isLast: state.index == cubit.lastIndex,
                      onContinue: cubit.onContinue,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
