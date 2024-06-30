

import 'package:flutter/material.dart';
import 'package:gemini_app/Screens/Authentication/login_screen.dart';
import 'package:gemini_app/Screens/Authentication/register_screen.dart';
import 'package:gemini_app/Screens/Home/home_screen.dart';
import 'package:gemini_app/Shared/Constants/data.dart';
import 'package:gemini_app/Shared/Helpers/shared_preferences.dart';

class AppRoutes {
  static const loginScreen = LoginScreen();
  static const registerScreen = RegisterScreen();
  static const homeScreen = HomeScreen();
  static Widget firstScreen() {
    String? tempuId = CacheHelper.getData("uId");
    if (tempuId==null) {
      return AppRoutes.loginScreen;
    }
    uId = tempuId;
    return AppRoutes.homeScreen;
    }
}

