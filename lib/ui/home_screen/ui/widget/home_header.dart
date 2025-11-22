import 'package:bonedetect/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/helper/spacer.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.userName, required this.onLogout});
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
        title: Text("Logout", style: Textstyles.font15blackBold()),
        content: Text(
          "Are you sure you want to logout?",
          style: Textstyles.font13grey600medium(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel", style: Textstyles.font14grey600medium()),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onLogout();
            },
            child: Text("Logout", style: Textstyles.font14errorRedmedium()),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
        child:
            Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.medical_information_outlined,
                              color: ColorPalette.white,
                              size: 22.sp,
                            ),
                            horizontalSpace(8),
                            Text(
                              'Hello, ${userName.split(" ").first}',
                              style: Textstyles.font16whitebold(),
                            ),
                          ],
                        ),
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
                    verticalSpace(12),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Text(
                        'Upload your X-ray image to start analysis',
                        style: Textstyles.font11whiteregular(),
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
