import 'package:bloc/bloc.dart';
import 'package:bonedetect/core/routes/app_images_routes.dart';
import 'package:bonedetect/core/routes/route_names.dart';
import 'package:flutter/material.dart';

import 'on_bording_screen_state.dart';

class OnBordingScreenCubit extends Cubit<OnBordingScreenState> {
  OnBordingScreenCubit() : super(const OnBordingScreenState(index: 0));

  final PageController controller = PageController();

  final List<Map<String, String>> pages = [
    {
      'image': AppImage().xray,
      'title': 'onb_title1',
      'subtitle': 'onb_sub1',
    },
    {
      'image': AppImage().doctorWithXray,
      'title': 'onb_title2',
      'subtitle': 'onb_sub2',
    },
    {
      'image': AppImage().report,
      'title': 'onb_title3',
      'subtitle': 'onb_sub3',
    },
  ];

  int get lastIndex => pages.length - 1;
  bool get isLast => state.index == lastIndex;

  void onPageChanged(int i) {
    emit(state.copyWith(index: i, action: OnbAction.none));
  }

  Future<void> onContinue() async {
    if (!isLast) {
      await controller.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
      return;
    }
    emit(state.copyWith(action: OnbAction.navigateLogin));
  }

  Future<void> onSkip(BuildContext context) async {
    Navigator.pushReplacementNamed(context, RouteNames.loginScreen);
  }

  @override
  Future<void> close() async {
    controller.dispose();
    return super.close();
  }
}
