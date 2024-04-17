import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:educonsult/widgets/app_bar/custom_app_bar.dart';
import 'package:educonsult/widgets/custom_text_form_field.dart';
import 'package:educonsult/widgets/custom_elevated_button.dart';
import 'package:educonsult/core/app_export.dart';
import 'package:http/http.dart' as http;


import '../../core/database_ip.dart';

class ConsulteeProfilePage extends StatefulWidget {
  ConsulteeProfilePage({Key? key}) : super(key: key);

  @override
  _ConsulteeProfilePageState createState() => _ConsulteeProfilePageState();
}

class _ConsulteeProfilePageState extends State<ConsulteeProfilePage> {
  late SharedPreferences prefs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    initializePreferences();
  }

  var name;
  late SharedPreferences prefCheckLogin;
  var username;
  var email;

  Future<void> initializePreferences() async {
    prefs = await SharedPreferences.getInstance();
    prefCheckLogin  = await SharedPreferences.getInstance();
    name = prefCheckLogin.getString("name")!;

    print(name);

    getProfileData(context);
  }

  Future<void> getProfileData(BuildContext context) async {
    try {
      DB_IP a = DB_IP();
      String ip = a.getIpAddr();
      var url = Uri.parse("http://$ip/Educonsult_API/consultee_profile.php");

      var response = await http.post(url, body: {
        'name': name,
      });

      if (response.body.isNotEmpty) {
        var decodedBody = jsonDecode(response.body);

        username = decodedBody[0]['Name'];
        email = decodedBody[0]['Email'];

        setState(() {

        });

      }
    } catch (e) {
      print("Fetch ProfileData Error: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 17.h,
                vertical: 10.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30,),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Profile",
                      style: TextStyle(color: Color(0xFF172452),fontSize: 30),
                    ),
                  ),
                  SizedBox(height: 20.v),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 77.v,
                      width: 75.h,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgPro,
                            height: 100.adaptSize,
                            width: 100.adaptSize,
                            radius: BorderRadius.circular(
                              37.h,
                            ),
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 19.v),
                  Text(
                    "Name",
                    style: CustomTextStyles.titleMediumInter,
                  ),
                  SizedBox(height: 3.v),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: appTheme.blue50, // Set the fill color
                    borderRadius: BorderRadius.circular(5.h), // Set the border radius
                  ),
                  padding: EdgeInsets.all(18.h), // Set the content padding
                  child: Text(
                    "$name",
                    style: theme.textTheme.titleSmall, // Set the text style
                  ),
                ),
                  SizedBox(height: 11.v),
                  Text(
                    "Email",
                    style: CustomTextStyles.titleMediumInter,
                  ),
                  SizedBox(height: 4.v),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: appTheme.blue50, // Set the fill color
                    borderRadius: BorderRadius.circular(5.h), // Set the border radius
                  ),
                  padding: EdgeInsets.all(18.h), // Set the content padding
                  child: Text(
                    "$email",
                    style: theme.textTheme.titleSmall, // Set the text style
                  ),
                ),
                  SizedBox(height: 50.v),

                  SizedBox(height: 30.v),
                  Center(
                    child: SizedBox(
                      height: 45.v,
                      width: 220.h,
                      child: ElevatedButton(
                        onPressed: () async {
                          prefs.setString("name","");
                          prefs.setString("designation","");
                          prefs.setBool("login", false);

                          print("log out");

                          bool? res = prefs.getBool("login");
                          if (res == false) {
                            print("log out Successful");
                            //Navigator.pushReplacementNamed(context, '/login_register_screen');
                            SystemNavigator.pop();
                            print("next");
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(
                              0xff172452)),
                        ),
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(

    );
  }
}
