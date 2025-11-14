import 'package:bonedetect/core/helper/spacer.dart';
import 'package:bonedetect/core/helper/validation_data.dart';
import 'package:bonedetect/core/routes/app_images_routes.dart';
import 'package:bonedetect/core/routes/route_names.dart';
import 'package:bonedetect/core/style/app_color.dart';
import 'package:bonedetect/core/style/textstyles.dart';
import 'package:bonedetect/core/widgets/app_button.dart';
import 'package:bonedetect/core/widgets/app_text_field.dart';
import 'package:bonedetect/core/widgets/animation_box.dart';
import 'package:bonedetect/ui/auth_screen/login_screen/ui/widgets/login_bottom_container.dart';
import 'package:bonedetect/ui/auth_screen/login_screen/ui/widgets/dont_have_account.dart';
import 'package:bonedetect/ui/auth_screen/login_screen/logic/cubit/login_screen_cubit.dart';
import 'package:bonedetect/ui/auth_screen/login_screen/data/repo/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  void _onLogin(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (!(_formKey.currentState?.validate() ?? false)) return;
    context.read<LoginScreenCubit>().login();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginScreenCubit(LoginRepository()),
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
              child: BlocConsumer<LoginScreenCubit, LoginScreenState>(
                listener: (context, state) {
                  if (state is LoginScreenSuccess) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RouteNames.homeScreen,
                      (route) => false,
                    );
                  } else if (state is LoginScreenError) {
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
                  final cubit = context.read<LoginScreenCubit>();
                  final isLoading = state is LoginScreenLoading;
                  return LoginBottomContainer(
                    title: "Welcome Back",
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          AppTextField(
                            controller: cubit.emailController,
                            labelText: "Email",
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: ValidationData.validateEmail,
                          ),
                          verticalSpace(16),
                          AppTextField(
                            controller: cubit.passwordController,
                            labelText: "Password",
                            isPassword: true,
                            textInputAction: TextInputAction.done,
                            validator: ValidationData.validatePassword,
                          ),
                          verticalSpace(18),
                          AppButton(
                            title: "Login",
                            onPressed: () => _onLogin(context),
                            isLoading: isLoading,
                          ),
                          verticalSpace(15),
                          DontHaveAccount(
                            onTap: () => Navigator.pushReplacementNamed(
                              context,
                              RouteNames.signUp,
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
