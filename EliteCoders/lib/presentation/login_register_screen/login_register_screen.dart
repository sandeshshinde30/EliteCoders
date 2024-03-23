import 'package:educonsult/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';

class LoginRegisterScreen extends StatelessWidget {
  const LoginRegisterScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 11.h,
            top: 64.v,
            right: 11.h,
          ),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgMaleProgrammer,
                height: 325.v,
                width: 290.h,
              ),
              SizedBox(height: 1.v),
              SizedBox(
                width: 218.h,
                child: Text(
                  "Welcome to \nUltimate Guide",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headline5,
                ),
              ),
              SizedBox(height: 15.v),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 300.h,
                  margin: EdgeInsets.only(
                    left: 40.h,
                    right: 30.h,
                  ),
                  child: Text(
                    "Guidance serves as the cornerstone of academic success",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headline4,
                  ),
                ),
              ),
              SizedBox(height: 65.v),
              _buildSixteen(context),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSixteen(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomElevatedButton(
            onPressed: (){Navigator.pushNamed(context, '/login_screen');},
            width: 120.h,
            height: 45.h,
            text: "Login",
            buttonStyle: CustomButtonStyles.fillPrimary,
            buttonTextStyle: TextStyle(color: Colors.white,fontSize: 15.h),
          ),
          CustomElevatedButton(
            onPressed: (){Navigator.pushNamed(context, '/i_am_screen');},
            width: 120.h,
            height: 45.h,
            text: "Register",
            margin: EdgeInsets.only(left: 23.h),
            buttonStyle:ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(
                210, 210, 210, 1.0))),
            buttonTextStyle: TextStyle(color: Colors.black,fontSize: 15.h),
          ),
        ],
      ),
    );
  }
}
