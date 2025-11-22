import 'package:bonedetect/core/helper/spacer.dart';
import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyVideoCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageAsset;
  final String youtubeUrl;

  const EmergencyVideoCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.youtubeUrl,
  });

  Future<void> _openVideo() async {
    final uri = Uri.parse(youtubeUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _openVideo,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 10.h,
        ),
        margin: EdgeInsets.symmetric(
          vertical: 6.h,
        ),
        decoration: BoxDecoration(
          color: ColorPalette.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: ColorPalette.black.withOpacity(0.05),
              blurRadius: 6.r,
              offset: Offset(0, 3.h),
            ),
          ],
          border: Border.all(
            color: ColorPalette.grey200,
            width: 1.w,
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset(
                imageAsset,
                width: 80.w,
                height: 60.h,
                fit: BoxFit.cover,
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Textstyles.font10blacksemiBold(),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Textstyles.font12grey600medium(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
