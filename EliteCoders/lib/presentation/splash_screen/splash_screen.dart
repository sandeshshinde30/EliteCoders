import 'dart:async';

import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // timing();
    checkLogin();
  }


  Future<void> checkLogin()
  async
  {
    var loginOrNot;
    var name;
    var designation;
    var prefCheckLogin = await SharedPreferences.getInstance();
    loginOrNot = prefCheckLogin.getBool("login");
    name = prefCheckLogin.getString("name");
    designation = prefCheckLogin.getString("designation");


    if(loginOrNot == null || loginOrNot == "")
    {
      Timer(Duration(seconds:2),()=>Navigator.pushNamed(context,'/login_register_screen'));
    }
    // else
    else if(!loginOrNot)
    {
      Timer(Duration(seconds:2),()=>Navigator.pushNamed(context,'/login_register_screen'));
    }
    else
    {
      print(name);
      if(designation == "consultee") Timer(Duration(seconds:2),()=>Navigator.pushReplacementNamed(context,'/home_screen_consultee_screen'));
      else Timer(Duration(seconds:2),()=>Navigator.pushReplacementNamed(context,'/home_screen_consultant_screen'));
    }
  }

  // // After 2 seconds it will call intro screen
  // Future<void> timing() async {
  //   Timer(
  //       Duration(seconds: 3),
  //       () =>
  //           Navigator.pushReplacementNamed(context, '/login_register_screen'));
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 41.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgEduconsultRemovebgPreview,
                height: 200.v,
                width: 220.h,
              ),
              SizedBox(height: 22.v),
              Text(
                "E D U C O N S U L T",
                style: CustomTextStyles.titleMediumPrimary,
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
