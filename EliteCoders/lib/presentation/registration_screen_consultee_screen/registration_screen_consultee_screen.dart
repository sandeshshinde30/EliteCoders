import 'package:educonsult/widgets/custom_text_form_field.dart';
import 'package:educonsult/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';

class RegistrationScreenConsulteeScreen extends StatelessWidget {
  RegistrationScreenConsulteeScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 27.h,
                  vertical: 52.v,
                ),
                child: Column(
                  children: [
                    Text(
                      "Create Account",
                      style: theme.textTheme.headlineSmall,
                    ),
                    SizedBox(height: 11.v),
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
                    SizedBox(height: 40.v),
                    _buildName(context),
                    SizedBox(height: 22.v),
                    _buildEmail(context),
                    SizedBox(height: 22.v),
                    _buildPassword(context),
                    SizedBox(height: 22.v),
                    _buildConfirmpassword(context),
                    SizedBox(height: 41.v),
                    _buildSignUp(context),
                    SizedBox(height: 32.v),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 41.h),
                        child: Text(
                          "Already have an account",
                          style: CustomTextStyles.titleMediumOnPrimary,
                        ),
                      ),
                    ),
                    SizedBox(height: 39.v),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 5.h,
                        right: 13.h,
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
                              "Or Login with",
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
                      padding: EdgeInsets.symmetric(horizontal: 79.h),
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
                                  imagePath: ImageConstant.imgUser,
                                  height: 11.v,
                                  alignment: Alignment.bottomRight,
                                  margin: EdgeInsets.only(bottom: 3.v),
                                ),
                                CustomImageView(
                                  imagePath: ImageConstant.imgMobile,
                                  height: 10.v,
                                  alignment: Alignment.bottomLeft,
                                  margin: EdgeInsets.only(left: 1.h),
                                ),
                                CustomImageView(
                                  imagePath: ImageConstant.imgVectorOnerror,
                                  width: 5.h,
                                  alignment: Alignment.centerLeft,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    height: 10.v,
                                    width: 19.h,
                                    margin: EdgeInsets.only(left: 1.h),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        CustomImageView(
                                          imagePath:
                                              ImageConstant.imgUserRed500,
                                          height: 10.v,
                                          alignment: Alignment.center,
                                        ),
                                        CustomImageView(
                                          imagePath:
                                              ImageConstant.imgUserRed500,
                                          height: 10.v,
                                          alignment: Alignment.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(
                            flex: 50,
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgVector,
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
                    SizedBox(height: 6.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return CustomTextFormField(
      controller: nameController,
      hintText: "Name",
      contentPadding: EdgeInsets.symmetric(
        horizontal: 26.h,
        vertical: 18.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      hintText: "Email",
      textInputType: TextInputType.emailAddress,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 27.h,
        vertical: 18.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
      controller: passwordController,
      hintText: "Password",
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 23.h,
        vertical: 18.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildConfirmpassword(BuildContext context) {
    return CustomTextFormField(
      controller: confirmpasswordController,
      hintText: "Confirm Password",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 17.h,
        vertical: 18.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildSignUp(BuildContext context) {
    return CustomElevatedButton(
      height: 50.v,
      text: "Sign up",
    );
  }
}
