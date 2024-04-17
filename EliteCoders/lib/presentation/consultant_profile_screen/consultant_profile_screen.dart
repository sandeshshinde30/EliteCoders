import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/database_ip.dart';
import '../../widgets/custom_bottom_bar_consultant.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;


class ConsultantProfileScreen extends StatefulWidget {
  ConsultantProfileScreen({Key? key}) : super(key: key);

  @override
  _ConsultantProfileScreenState createState() =>
      _ConsultantProfileScreenState();
}

class _ConsultantProfileScreenState extends State<ConsultantProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController twentyTwoController = TextEditingController();
  TextEditingController twentyTwoController1 = TextEditingController();
  List<String> dropdownItemList = ["Second Year", "Third Year", "Fourth Year"];
  var prefCheckLogin;
  var prefs;
  var name;
  var username;
  var email;
  var college;
  var branch;
  var year;

  @override
  void initState() {
    super.initState();
    initializePreferences();
  }

  Future<void> initializePreferences() async {
    prefCheckLogin  = await SharedPreferences.getInstance();
    name = prefCheckLogin.getString("name")!;

    print(name);

    getProfileData(context);
  }

  Future<void> getProfileData(BuildContext context) async {
    try {
      DB_IP a = DB_IP();
      String ip = a.getIpAddr();
      var url = Uri.parse("http://$ip/Educonsult_API/consultant_profile.php");

      var response = await http.post(url, body: {
        'name': name,
      });

      if (response.body.isNotEmpty) {
        var decodedBody = jsonDecode(response.body);

        print(decodedBody);
        username = decodedBody[0]['Name'];
        email = decodedBody[0]['Email'];
        college = decodedBody[0]['College'];
        branch = decodedBody[0]['Branch'];
        year = decodedBody[0]['Year'];

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
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 17.h,
                  vertical: 15.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Profile",
                        style: TextStyle(color: Color(0xFF172452), fontSize: 30),
                      ),
                    ),
                    SizedBox(height: 12.v),
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
                              radius: BorderRadius.circular(37.h),
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.v),
                    Text(
                      "Name",
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 3.v),
                    _buildName(context),
                    SizedBox(height: 11.v),
                    Text(
                      "Email",
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 3.v),
                    _buildEmail(context),
                    SizedBox(height: 13.v),
                    Text(
                      "College",
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 3.v),
                    _buildTwentyTwo(context),
                    SizedBox(height: 13.v),
                    Text(
                      "Department",
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 3.v),
                    _buildTwentyTwo1(context),
                    SizedBox(height: 12.v),
                    Text(
                      "Year",
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 3.v),
                    CustomDropDown(
                      hintText: "$year",
                      items: dropdownItemList,
                    ),
                    SizedBox(height: 36.v),
                    Center(
                      child: SizedBox(
                        height: 45.v,
                        width: 220.h,
                        child: ElevatedButton(
                          onPressed: () async {
                            prefs = await SharedPreferences.getInstance();
                            prefs.setString("name", "");
                            prefs.setString("designation", "");
                            prefs.setBool("login", false);
                            SystemNavigator.pop();
                            bool? res = prefs.getBool("login");
                            if (res == false) {
                              SystemNavigator.pop();
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xffd7e5fd),
                            ),
                          ),
                          child: Text(
                            'Log Out',
                            style: TextStyle(
                              color: Color(0xff172452),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 6.v),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {
            final currentRoute = getCurrentRoute(type);
            if (currentRoute == AppRoutes.homeScreenConsultantScreen) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, getCurrentRoute(type));
            }
          },
        ),
      ),
    );
  }

  Widget _buildName(BuildContext context) {
    return CustomTextFormField(
      controller: nameController,
      hintText: "$username",
      autofocus: false,
    );
  }

  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      hintText: "$email",
      textInputType: TextInputType.emailAddress,
      autofocus: false,
    );
  }

  Widget _buildTwentyTwo(BuildContext context) {
    return CustomTextFormField(
      controller: twentyTwoController,
      hintText: "$college",
      autofocus: false,
    );
  }

  Widget _buildTwentyTwo1(BuildContext context) {
    return CustomTextFormField(
      controller: twentyTwoController1,
      hintText: "$branch",
      textInputAction: TextInputAction.done,
      autofocus: false,
    );
  }

  Widget _buildSaveChanges(BuildContext context) {
    return CustomElevatedButton(
      height: 45.v,
      width: 221.h,
      text: "Save changes",
      alignment: Alignment.center,
    );
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeScreenConsultantScreen;
      case BottomBarEnum.Requests:
        return AppRoutes.request_loader;
      case BottomBarEnum.Chat:
        return AppRoutes.consultantChatLoader;
      case BottomBarEnum.Profile:
        return AppRoutes.consultantProfileScreen;
      default:
        return '/';
    }
  }
}
