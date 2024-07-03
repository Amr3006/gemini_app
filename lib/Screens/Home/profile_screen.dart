// ignore_for_file: prefer_const_constructors

import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_app/Shared/Constants/dimenstions.dart';
import 'package:gemini_app/Shared/Core/assets_paths.dart';
import 'package:gemini_app/Shared/Widgets/seperator.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: Pads.medium_Padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      AssetsPaths.backgroundImage,
                      fit: BoxFit.cover,
                      height: (screen_height / 3).h,
                      width: screen_width,
                    ),
                    BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: const SizedBox()),
                    CircleAvatar(
                      radius: 86.r,
                      backgroundColor: Colors.white,
                    ),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 80.r,
                          backgroundImage: NetworkImage(
                              "https://fiverr-res.cloudinary.com/q_auto,f_auto/gigs/216948547/original/f024e89e889e075d23d43638def00b56c4ac9b80.jpg"),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.lightGreen[300],
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_enhance,
                              color: Colors.green[900],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Gaps.medium_Gap,
              TextFormField(
                cursorColor: Colors.green[300],
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "validatorText";
                  }
                  return null;
                },
                style: GoogleFonts.aBeeZee(color: Colors.black, fontSize: 26.sp,),
                controller: TextEditingController()..text = "Amr Khaled",
                maxLines: 2,
                minLines: 1,
                enabled: false,
                decoration: InputDecoration(
                    contentPadding: Pads.medium_Padding,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            BorderSide(color: Colors.green[900]!, width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            BorderSide(color: Colors.green[700]!, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            BorderSide(color: Colors.green[700]!, width: 2)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            BorderSide(color: Colors.red[700]!, width: 2)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.red, width: 2)),
                    disabledBorder: InputBorder.none,
                    errorStyle: TextStyle(color: Colors.red[200])),
              ),
              Gaps.huge_Gap,
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(onPressed: () {
                      
                    },
                    color: Colors.green[900],
                    elevation: 10,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    padding: Pads.small_Padding,
                    child: Text("LOGOUT", style: TextStyle(color: Colors.white,fontSize: 20.sp),),
                    ),
                  ),
                  Gaps.small_Gap,
                  Expanded(
                    child: MaterialButton(onPressed: () {
                      
                    },
                    color: Colors.green[900],
                    elevation: 10,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    padding: Pads.small_Padding,
                    child: Text("EDIT NAME", style: TextStyle(color: Colors.white,fontSize: 20.sp),),
                    ),
                  ),
                ],
              ),
              Gaps.large_Gap,
              Padding(
                padding: Pads.h_medium_Padding,
                child: Text("History",
                    style:GoogleFonts.montserrat(
                      fontSize: 23.sp,
                    )),
              ),
                hSeperator()
            ],
          ),
        ),
      ),
    );
  }
}
