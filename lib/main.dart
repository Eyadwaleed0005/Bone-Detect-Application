import 'package:bonedetect/core/dio_helper/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bonedetect/core/routes/app_routes.dart';
import 'package:bonedetect/core/routes/route_names.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(257, 557),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Bone Detect',
          debugShowCheckedModeBanner: false,
          initialRoute: RouteNames.signUp,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
