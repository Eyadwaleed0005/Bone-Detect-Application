import 'package:bonedetect/core/style/textstyles.dart';
import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/helper/spacer.dart';
import 'package:bonedetect/ui/home_screen/logic/cubit/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.userName,
    required this.onLogout,
  });

  final String userName;
  final VoidCallback onLogout;

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: ColorPalette.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        title: Text(
          "logout".tr(),
          style: Textstyles.font15blackBold(),
        ),
        content: Text(
          "logout_confirm".tr(),
          style: Textstyles.font13grey600medium(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "cancel".tr(),
              style: Textstyles.font14grey600medium(),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onLogout();
            },
            child: Text(
              "logout".tr(),
              style: Textstyles.font14errorRedmedium(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isEnglish = context.locale.languageCode == 'en';

    return Container(
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: ColorPalette.backgroundGradient,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(22.r),
          bottomLeft: Radius.circular(22.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 23.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.medical_information_outlined,
                        color: ColorPalette.white,
                        size: 22.sp,
                      ),
                      horizontalSpace(8),
                      Expanded(
                        child: Text(
                          '${"hello".tr()}, ${userName.split(" ").first}',
                          style: Textstyles.font16whitebold(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                      ),
                    ],
                  ),
                ),
                horizontalSpace(8),
                FittedBox(
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          final currentLocale = context.locale;
                          context
                              .read<HomeScreenCubit>()
                              .toggleLanguage(currentLocale);
                        },
                        borderRadius: BorderRadius.circular(20.r),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.language,
                                color: ColorPalette.white,
                                size: 16.sp,
                              ),
                              horizontalSpace(4),
                              Text(
                                isEnglish ? 'EN' : 'AR',
                                style: Textstyles.font11whiteregular(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      horizontalSpace(6),
                      GestureDetector(
                        onTap: () => showLogoutDialog(context),
                        child: Container(
                          padding: EdgeInsets.all(6.r),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.logout_rounded,
                            color: ColorPalette.white,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpace(12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                "upload_to_start".tr(),
                style: Textstyles.font11whiteregular(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        )
            .animate()
            .fadeIn(duration: 500.ms, delay: 150.ms)
            .slideY(begin: -0.2, end: 0, duration: 500.ms),
      ),
    );
  }
}
