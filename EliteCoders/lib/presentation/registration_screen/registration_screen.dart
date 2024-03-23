import 'package:educonsult/widgets/custom_text_form_field.dart';
import 'package:educonsult/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 28.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 45.h),
                    child: Text(
                      "Create Account",
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                ),
                SizedBox(height: 18.v),
                SizedBox(
                  width: 212.h,
                  child: Text(
                    "Sign up now to unlock the world of Guidance",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.titleMediumBluegray800,
                  ),
                ),
                SizedBox(height: 65.v),
                _buildThirteen(context),
                SizedBox(height: 22.v),
                _buildPassword(context),
                SizedBox(height: 22.v),
                _buildConfirmpassword(context),
                SizedBox(height: 41.v),
                _buildSignUp(context),
                SizedBox(height: 32.v),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/login_screen');
                    },
                    child: Text(
                      "Already have an account",
                      style: TextStyle(
                          fontFamily: 'popins',
                          fontSize: 15.h,
                          color: Color(0xFF172452)),
                    ),
                  ),
                ),
                SizedBox(height: 39.v),
                Padding(
                  padding: EdgeInsets.only(
                    left: 4.h,
                    right: 12.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10.v,
                          bottom: 11.v,
                        ),
                        child: SizedBox(
                          width: 89.h,
                          child: Divider(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 7.h),
                        child: Text(
                          "Login with",
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10.v,
                          bottom: 11.v,
                        ),
                        child: SizedBox(
                          width: 94.h,
                          child: Divider(
                            indent: 5.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 36.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 78.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 24.v,
                        width: 25.h,
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.googleIcon,
                              height: 25.adaptSize,
                              width: 25.adaptSize,
                              alignment: Alignment.bottomLeft,
                              margin: EdgeInsets.only(left: 1.h),
                            ),
                          ],
                        ),
                      ),
                      Spacer(
                        flex: 50,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgVector,
                        height: 26.v,
                        width: 23.h,
                      ),
                      Spacer(
                        flex: 49,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgFacebook,
                        height: 25.adaptSize,
                        width: 25.adaptSize,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      autofocus: false,
      width: 303.h,
      controller: emailController,
      hintText: "Email",
      textInputType: TextInputType.emailAddress,
      alignment: Alignment.center,
    );
  }

  /// Section Widget
  Widget _buildThirteen(BuildContext context) {
    return SizedBox(
      height: 57.v,
      width: 303.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 28.h),
              child: Text(
                "Email",
                style: theme.textTheme.titleMedium,
              ),
            ),
          ),
          _buildEmail(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
      autofocus: false,
      controller: passwordController,
      hintText: "Password",
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
    );
  }

  /// Section Widget
  Widget _buildConfirmpassword(BuildContext context) {
    return CustomTextFormField(
      autofocus: false,
      controller: confirmpasswordController,
      hintText: "Confirm Password",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
    );
  }

  /// Section Widget
  Widget _buildSignUp(BuildContext context) {
    return CustomElevatedButton(
      onPressed: (){Navigator.pushReplacementNamed(context, '/home_screen_consultee_screen');},
      height: 50.v,
      text: "Sign up",
    );
  }
}
