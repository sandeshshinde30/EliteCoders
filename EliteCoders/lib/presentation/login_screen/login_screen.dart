import 'dart:convert';

import 'package:educonsult/widgets/custom_text_form_field.dart';
import 'package:educonsult/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initializePreferences();
  }

  Future<void> initializePreferences() async {
    prefs  = await SharedPreferences.getInstance();
  }

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
                Text(
                  "Login Here",
                  style: TextStyle(fontSize: 25.h, fontFamily: 'Popins', fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 15.v),
                Container(
                  width: 224.h,
                  margin: EdgeInsets.only(
                    left: 39.h,
                    right: 40.h,
                  ),
                  child: Text(
                    "Welcome back you’ve been missed",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.titleMediumBluegray800,
                  ),
                ),
                SizedBox(height: 45.v),
                _buildSeventeen(context),
                SizedBox(height: 20.v),
                _buildSeventeen1(context),
                SizedBox(height: 19.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(fontFamily: 'popins', fontSize: 14.h, color: Color(0xFF169BD7)),
                  ),
                ),
                SizedBox(height: 35.v),
                CustomElevatedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/home_screen_consultee_screen');
                    if(emailController.text.toString()=="" || passwordController.text.toString()=="")
                      {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text("Please enter username or password"),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            }
                        );
                      }
                    else
                      {
                        print(emailController.text.toString());
                        print(passwordController.text.toString());
                        showDialog(context: context, builder: (context) => Center(child: CircularProgressIndicator(color: Color(0xFF169BD7),)));
                        checkUserRegistered(context);
                      }
                  },
                  height: 50.v,
                  width: MediaQuery.of(context).size.width,
                  buttonTextStyle: TextStyle(fontSize: 18.h, fontFamily: 'popins', color: Colors.white),
                  text: "Sign in",
                ),
                SizedBox(height: 31.v),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(right: 0.h),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/i_am_screen');
                      },
                      child: Text(
                        "Create new account",
                        style: TextStyle(fontFamily: 'popins', fontSize: 15.h, color: Color(0xFF172452)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10.v,
                            bottom: 11.v,
                          ),
                          child: SizedBox(
                            width: 60.h,
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
                            width: 60.h,
                            child: Divider(
                              indent: 5.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 36.v),
                Padding(
                  padding: EdgeInsets.only(
                    left: 75.h,
                    right: 81.h,
                  ),
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
  Widget _buildSeventeen(BuildContext context) {
    return CustomTextFormField(
      autofocus: false,
      controller: emailController,
      hintText: "Email",
      textStyle: theme.textTheme.titleSmall,
      hintStyle: theme.textTheme.titleMedium,
      textInputType: TextInputType.visiblePassword,
    );
  }

  Widget _buildSeventeen1(BuildContext context) {
    return CustomTextFormField(
      autofocus: false,
      controller: passwordController,
      hintText: "Password",
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
    );
  }


// Login API Calling function
  Future checkUserRegistered(BuildContext context) async {
    try {
      var url = Uri.parse("http://192.168.52.145/EduConsult_API/login.php");

      var response = await http.post(url, body: {
        'Username': emailController.text.toString(),
        'Password': passwordController.text.toString()
      });

      Map Data;
      if (response.body.isNotEmpty) {
        Data = jsonDecode(response.body);

        // Data = "false";
        if (Data['result'] == "true") {
          Navigator.of(context).pop();

          // If login success then storing name

          prefs.setString("name", Data['name']);
          prefs.setString("designation", Data['designation']);
          prefs.setBool("login", true);

          if(Data['designation'] == "consultee") Navigator.pushReplacementNamed(context, '/home_screen_consultee_screen',arguments: Data['name'] );
          else Navigator.pushReplacementNamed(context, '/home_screen_consultant_screen',arguments: Data['name']);
        }
        else {
          Navigator.of(context).pop();
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text("Invalid Login",),
                  actions: <Widget>[
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              }
          );
        }
      }
    }
    catch(e) {
      Navigator.of(context).pop();
      print("Login Error");
      print(e);
    }
  }
}

