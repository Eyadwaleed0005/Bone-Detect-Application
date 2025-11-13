import 'package:bonedetect/ui/auth_screen/login_screen/ui/login_screen.dart';
import 'package:bonedetect/ui/home_screen/ui/home_screen.dart';
import 'package:bonedetect/ui/on_bording_screen/ui/on_bording_screen.dart';
import 'package:bonedetect/ui/auth_screen/sign_up_screen/ui/sign_up_screen.dart';
import 'package:bonedetect/ui/question_screen/ui/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:bonedetect/ui/start_screen/ui/start_screen.dart';
import 'route_names.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.startScreen:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case RouteNames.onBordingScreen:
        return MaterialPageRoute(builder: (_) => const OnBordingScreen());
      case RouteNames.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteNames.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RouteNames.questionScreen:
        return MaterialPageRoute(builder: (_) => const QuestionScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
