import 'package:bonedetect/core/helper/spacer.dart';
import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRadioTile<T> extends StatelessWidget {
  const AppRadioTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    this.error = false,
  });

  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;
  final String title;
  final bool error;

  bool get _isSelected => value == groupValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.r),
        onTap: () => onChanged(value),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: _isSelected
                  ? ColorPalette.lightBlue
                  : error
                      ? Colors.red
                      : ColorPalette.grey300,
              width: 1,
            ),
            color: _isSelected
                ? ColorPalette.lightBlue.withOpacity(0.05)
                : Colors.transparent,
          ),
          child: Row(
            children: [
              Container(
                width: 20.w,
                height: 20.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _isSelected
                        ? ColorPalette.lightBlue
                        : error
                            ? Colors.red
                            : ColorPalette.grey400,
                    width: 2.w,
                  ),
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _isSelected
                        ? ColorPalette.lightBlue
                        : Colors.transparent,
                  ),
                ),
              ),
              horizontalSpace(16),
              Expanded(
                child: Text(
                  title,
                  style: Textstyles.font12blackregular(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
