// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_app/Logic/bloc_observer.dart';
import 'package:gemini_app/Shared/Constants/Dimensions.dart';
import 'package:gemini_app/Shared/Core/app_routes.dart';
import 'package:gemini_app/Shared/Design/Theme.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // Getting Screen Dimensions
    var size = MediaQuery.of(context).size;
    screen_height = size.height;
    screen_width = size.width;

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: AppRoutes.loginScreen
      ),
    );
  }
}

