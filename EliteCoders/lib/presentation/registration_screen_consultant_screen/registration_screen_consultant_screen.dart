import 'package:educonsult/widgets/custom_text_form_field.dart';
import 'package:educonsult/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';

class RegistrationScreenConsultantScreen extends StatelessWidget {
  RegistrationScreenConsultantScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController collegeController = TextEditingController();

  TextEditingController branchController = TextEditingController();

  TextEditingController refreshController = TextEditingController();

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
                  horizontal: 26.h,
                  vertical: 42.v,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 47.h),
                        child: Text(
                          "Create Account",
                          style: theme.textTheme.headlineSmall,
                        ),
                      ),
                    ),
                    SizedBox(height: 37.v),
                    _buildTwentyThree(context),
                    SizedBox(height: 16.v),
                    _buildTwentyTwo(context),
                    SizedBox(height: 16.v),
                    _buildCollege(context),
                    SizedBox(height: 18.v),
                    _buildBranch(context),
                    SizedBox(height: 16.v),
                    _buildRefresh(context),
                    SizedBox(height: 16.v),
                    _buildPassword(context),
                    SizedBox(height: 14.v),
                    _buildConfirmpassword(context),
                    SizedBox(height: 21.v),
                    _buildTwentyFour(context),
                    SizedBox(height: 2.v),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 82.h,
                          right: 10.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "*only jpeg",
                              style: theme.textTheme.labelMedium,
                            ),
                            Text(
                              "*only jpeg",
                              style: theme.textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 19.v),
                    _buildSignUp(context),
                    SizedBox(height: 33.v),
                    Text(
                      "Already have an account",
                      style: CustomTextStyles.titleMediumOnPrimary,
                    ),
                    SizedBox(height: 5.v),
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
      width: 303.h,
      controller: nameController,
      hintText: "Name",
      alignment: Alignment.center,
    );
  }

  /// Section Widget
  Widget _buildTwentyThree(BuildContext context) {
    return SizedBox(
      height: 44.v,
      width: 303.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 28.h,
                bottom: 4.v,
              ),
              child: Text(
                "Email",
                style: theme.textTheme.titleMedium,
              ),
            ),
          ),
          _buildName(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      width: 303.h,
      controller: emailController,
      hintText: "Email",
      textInputType: TextInputType.emailAddress,
      alignment: Alignment.center,
    );
  }

  /// Section Widget
  Widget _buildTwentyTwo(BuildContext context) {
    return SizedBox(
      height: 44.v,
      width: 303.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 28.h,
                bottom: 4.v,
              ),
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
  Widget _buildCollege(BuildContext context) {
    return CustomTextFormField(
      controller: collegeController,
      hintText: "College",
    );
  }

  /// Section Widget
  Widget _buildBranch(BuildContext context) {
    return CustomTextFormField(
      controller: branchController,
      hintText: "Branch",
    );
  }

  /// Section Widget
  Widget _buildRefresh(BuildContext context) {
    return CustomTextFormField(
      controller: refreshController,
      hintText: "Year",
      suffix: Container(
        margin: EdgeInsets.fromLTRB(30.h, 12.v, 18.h, 12.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgRefresh,
          height: 16.v,
        ),
      ),
      suffixConstraints: BoxConstraints(
        maxHeight: 44.v,
      ),
      contentPadding: EdgeInsets.only(
        left: 20.h,
        top: 11.v,
        bottom: 11.v,
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
    );
  }

  /// Section Widget
  Widget _buildConfirmpassword(BuildContext context) {
    return CustomTextFormField(
      controller: confirmpasswordController,
      hintText: "ConfirmPassword",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
    );
  }

  /// Section Widget
  Widget _buildIDPhoto(BuildContext context) {
    return Expanded(
      child: CustomElevatedButton(
        height: 44.v,
        text: "ID Photo",
        margin: EdgeInsets.only(right: 9.h),
        rightIcon: Container(
          margin: EdgeInsets.only(left: 15.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgUserBlueGray900,
            height: 20.adaptSize,
            width: 20.adaptSize,
          ),
        ),
        buttonStyle: CustomButtonStyles.fillBlue,
        buttonTextStyle: theme.textTheme.titleMedium!,
      ),
    );
  }

  /// Section Widget
  Widget _buildResume(BuildContext context) {
    return Expanded(
      child: CustomElevatedButton(
        height: 44.v,
        text: "Resume",
        margin: EdgeInsets.only(left: 9.h),
        rightIcon: Container(
          margin: EdgeInsets.only(left: 19.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgUserBlueGray900,
            height: 20.adaptSize,
            width: 20.adaptSize,
          ),
        ),
        buttonStyle: CustomButtonStyles.fillBlue,
        buttonTextStyle: theme.textTheme.titleMedium!,
      ),
    );
  }

  /// Section Widget
  Widget _buildTwentyFour(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 5.h,
        right: 8.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIDPhoto(context),
          _buildResume(context),
        ],
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
