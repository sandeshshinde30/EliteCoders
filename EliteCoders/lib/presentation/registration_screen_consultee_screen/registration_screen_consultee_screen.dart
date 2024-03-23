import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;

class RegistrationScreenConsulteeScreen extends StatefulWidget {
  RegistrationScreenConsulteeScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenConsulteeScreenState createState() =>
      _RegistrationScreenConsulteeScreenState();
}

class _RegistrationScreenConsulteeScreenState
    extends State<RegistrationScreenConsulteeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
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


  bool checkRegistrationFieldsnotEmpty() {
    if (nameController.text.toString().isEmpty) {
      alert("Please enter name!!");
      return false;
    } else if (emailController.text.toString().isEmpty) {
      alert("Please enter email!!");
      return false;
    } else if (passwordController.text.toString().isEmpty) {
      alert("Please enter password!!");
      return false;
    } else if (confirmpasswordController.text.toString().isEmpty) {
      alert("Please re-enter password!!");
      return false;
    } else if (passwordController.text.toString() != confirmpasswordController.text.toString()) {
      alert("Password and Confirm password doesn't match!!");
      return false;
    } else
      return true;
  }

  Future<void> Register() async
  {
    try{
      var url = Uri.parse("http://192.168.52.145/EduConsult_API/upload_consultee_reg_details.php");

      print(nameController.text.toString());
      print(emailController.text.toString());
      print(passwordController.text.toString());
      print(confirmpasswordController.text.toString());
      // print(imageNameID);
      // print(imageDataID);

      var response = await http.post(url, body: {
        'consultee_name' : nameController.text.toString(),
        'consultee_email' : emailController.text.toString(),
        'consultee_password' : passwordController.text.toString(),
      });

      if (response.body.isNotEmpty) {
        var res = jsonDecode(response.body);

        if (res.containsKey("error")) {
          // Handle error
          print("Error: ${res["error"]}");
          alert("Error while Registration, Please try again..");

        } else if (res.containsKey("message")) {

          prefs.setString("name",nameController.text.toString());
          prefs.setString("designation", res['designation']);
          prefs.setBool("login", true);

          print("Success: ${res["message"]}");
          print(res['designation']);
          RegSuccessalert("Registration Successfull",res['designation']);

        }
      }
    }
    catch(e){print(e);
    }
  }

  void RegSuccessalert(String content , String designation) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text('$content'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if(designation == "consultee") Navigator.pushReplacementNamed(context, '/home_screen_consultee_screen' );
                else Navigator.pushReplacementNamed(context, '/home_screen_consultant_screen');
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void alert(String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text('$content'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }



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
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, '/login_screen');
                        },
                        child: Text(
                          "Already have an account",
                          style: CustomTextStyles.titleMediumOnPrimary,
                        ),
                      ),
                    ),
                    SizedBox(height: 39.v),
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
      onPressed: (){
       bool res = checkRegistrationFieldsnotEmpty();
        if(res) Register();
        else print("problem");
      },
      height: 50.v,
      text: "Sign up",
    );
  }
}
