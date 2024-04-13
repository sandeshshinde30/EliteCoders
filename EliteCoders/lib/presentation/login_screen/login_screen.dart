import 'dart:convert';

import 'package:educonsult/widgets/custom_text_form_field.dart';
import 'package:educonsult/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';
import 'package:educonsult/core/database_ip.dart';
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
                        checkUserRegistered(context,emailController.text.toString(),passwordController.text.toString());
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
  Future<void> checkUserRegistered(BuildContext context,String uname,String pass) async {
    try {
      DB_IP a = DB_IP();
      String ip = a.getIpAddr();
      var url = Uri.parse("http://$ip/EduConsult_API/login.php");

      var response = await http.post(url, body: {
        'Username': uname,
        'Password': pass
      });

      print("hii");

      if (response.body.isNotEmpty) {
        var data = jsonDecode(response.body);

        print(data);


        if (data['result'] == "true") {
            Navigator.of(context).pop();
            print("hello");

            prefs.setString("name", data['name'].toString());
            prefs.setString("designation", data['designation'].toString());
            prefs.setBool("login", true);

            if (data['designation'] == "consultee") {
              Navigator.pushReplacementNamed(context, '/home_screen_consultee_screen', arguments: data['name']);
            } else {
              Navigator.pushReplacementNamed(context, '/home_screen_consultant_screen', arguments: data['name']);
            }
          } else {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text("Invalid Login"),
                  actions: <Widget>[
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        }
          else {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text("Invalid Login"),
                  actions: <Widget>[
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
    }
    catch (e) {
      Navigator.of(context).pop();
      print("Login Error: $e");
    }
  }


}

