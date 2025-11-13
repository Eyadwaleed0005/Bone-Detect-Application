import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.keyboardType,
    this.textInputAction,
    this.isPassword = false,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.width,
    this.height,
    this.contentPadding,
    this.prefixIcon,
    this.enabled = true,
  });

  final TextEditingController controller;
  final String? labelText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool isPassword;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode autovalidateMode;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? contentPadding;
  final IconData? prefixIcon;
  final bool enabled;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final borderRadius = 12.r;

    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height,
      child: TextSelectionTheme(
        data: TextSelectionThemeData(
          cursorColor: ColorPalette.darkBlue, 
          selectionColor: ColorPalette.lightBlue.withOpacity(0.25), 
          selectionHandleColor: ColorPalette.darkBlue, 
        ),
        child: TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          obscureText: widget.isPassword ? _obscurePassword : false,
          enabled: widget.enabled,
          validator: widget.validator,
          autovalidateMode: widget.autovalidateMode,
          cursorColor: ColorPalette.darkBlue,
          cursorWidth: 1.6.w,
          cursorRadius: Radius.circular(2.r),
          cursorHeight: 15.h,
          style: Textstyles.font12blackregular(),
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: Textstyles.font12grey600medium(),
            floatingLabelStyle: Textstyles.font10blacksemiBold(),
            filled: true,
            fillColor: ColorPalette.white,
            prefixIcon: widget.prefixIcon != null
                ? Icon(widget.prefixIcon, size: 20.sp, color: ColorPalette.grey600)
                : null,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: ColorPalette.grey600,
                      size: 20.sp,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  )
                : null,
            contentPadding: widget.contentPadding ??
                EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: ColorPalette.borderGrey,
                width: 1.2.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: ColorPalette.darkBlue, width: 1.3.w),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: ColorPalette.borderRed, width: 1.2.w),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: ColorPalette.borderRed, width: 1.3.w),
            ),
            errorStyle: Textstyles.font8errorRedmedium(),
            errorMaxLines: 2,
          ),
        ),
      ),
    );
  }
}
