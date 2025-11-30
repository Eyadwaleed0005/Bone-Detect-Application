import 'package:bonedetect/core/helper/spacer.dart';
import 'package:bonedetect/core/helper/validation_data.dart';
import 'package:bonedetect/core/routes/app_images_routes.dart';
import 'package:bonedetect/core/routes/route_names.dart';
import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/style/textstyles.dart';
import 'package:bonedetect/core/widgets/app_button.dart';
import 'package:bonedetect/core/widgets/app_text_field.dart';
import 'package:bonedetect/ui/auth_screen/login_screen/ui/widgets/login_bottom_container.dart';
import 'package:bonedetect/ui/auth_screen/sign_up_screen/data/repo/sign_up_repository.dart';
import 'package:bonedetect/ui/auth_screen/sign_up_screen/logic/sign_up_cubit.dart';
import 'package:bonedetect/ui/auth_screen/sign_up_screen/ui/widgets/already_have_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bonedetect/core/widgets/animation_box.dart';
import 'package:easy_localization/easy_localization.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  void _onSignUp(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (!(_formKey.currentState?.validate() ?? false)) return;
    context.read<SignUpCubit>().signUp();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(SignUpRepository()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: ColorPalette.backgroundGradient,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BlocConsumer<SignUpCubit, SignUpState>(
                listener: (context, state) {
                  if (state is SignUpSuccess) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RouteNames.homeScreen,
                      (route) => false,
                    );
                  } else if (state is SignUpError) {
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
                builder: (context, state) {
                  final cubit = context.read<SignUpCubit>();
                  final isLoading = state is SignUpLoading;

                  return LoginBottomContainer(
                    title: "create_account".tr(),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          AppTextField(
                            controller: cubit.nameController,
                            labelText: "full_name".tr(),
                            textInputAction: TextInputAction.next,
                            validator: ValidationData.validateName,
                          ),
                          verticalSpace(16),
                          AppTextField(
                            controller: cubit.emailController,
                            labelText: "email".tr(),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: ValidationData.validateEmail,
                          ),
                          verticalSpace(16),
                          AppTextField(
                            controller: cubit.passwordController,
                            labelText: "password".tr(),
                            isPassword: true,
                            textInputAction: TextInputAction.done,
                            validator: ValidationData.validatePassword,
                          ),
                          verticalSpace(18),
                          AppButton(
                            title: "sign_up".tr(),
                            onPressed: () => _onSignUp(context),
                            isLoading: isLoading,
                          ),
                          verticalSpace(15),
                          AlreadyHaveAccount(
                            onTap: () => Navigator.pushReplacementNamed(
                              context,
                              RouteNames.loginScreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
