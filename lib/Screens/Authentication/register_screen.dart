import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_app/Logic/Register%20Cubit/register_cubit.dart';
import 'package:gemini_app/Shared/Constants/Dimensions.dart';
import 'package:gemini_app/Shared/Core/assets_paths.dart';
import 'package:gemini_app/Shared/Widgets/auth_text_form_field.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            body: Stack(
              children: [
                Image.asset(
                  AssetsPaths.backgroundImage,
                  height: screen_height,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.none,
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: SingleChildScrollView(
                    child: Container(
                      width: screen_width,
                      height: screen_height,
                      padding: Pads.medium_Padding,
                      child: Center(
                        child: SafeArea(
                          child: Form(
                            key: key,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "REGISTERR",
                                  style: GoogleFonts.aBeeZee(
                                      color: Colors.white.withOpacity(0.85),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 45.sp),
                                ),
                                Gaps.tiny_Gap,
                                Text(
                                  textAlign: TextAlign.center,
                                  "Create a new account to access all of our (I don know)",
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.white.withOpacity(0.85),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Gaps.huge_Gap,
                                AuthTextFormField(
                                    controller: cubit.emailController,
                                    hintText: "Name",
                                    validatorText: "Please enter your name"),
                                Gaps.medium_Gap,
                                AuthTextFormField(
                                    controller: cubit.emailController,
                                    hintText: "E-mail",
                                    type: TextInputType.emailAddress,
                                    validatorText: "Please enter your e-mail"),
                                Gaps.medium_Gap,
                                // note
                                AuthTextFormField(
                                    controller: cubit.passwordController,
                                    hintText: "Password",
                                    type: TextInputType.visiblePassword,
                                    validatorText: "Please enter your password",
                                    obscured: cubit.obscured,
                                    suffixEnabled: true,
                                    suffixFunction: () {
                                      cubit.changeObscurity();
                                    },
                                    suffixIcon: Icons.remove_red_eye),
                                Gaps.medium_Gap,
                                MaterialButton(
                                  onPressed: () {
                                    if (key.currentState!.validate()) {

                                    }
                                  },
                                  minWidth: screen_width,
                                  height: 45.h,
                                  color: Colors.green[400],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Text(
                                    "REGISTER",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
    ;
  }
}
