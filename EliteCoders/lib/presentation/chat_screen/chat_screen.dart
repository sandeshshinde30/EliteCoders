import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:math';
import 'package:educonsult/widgets/app_bar/custom_app_bar.dart';
import 'package:educonsult/widgets/app_bar/appbar_leading_image.dart';
import 'package:educonsult/widgets/app_bar/appbar_title_circleimage.dart';
import 'package:educonsult/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:educonsult/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:educonsult/widgets/custom_elevated_button.dart';
import 'package:educonsult/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../core/database_ip.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int i = 0;
  TextEditingController receiveController = TextEditingController();
  late TextEditingController sendController = TextEditingController();
  late SharedPreferences prefCheckLogin;

  late List<Map<dynamic, dynamic>> msg = [];
  var consultant_name;
  var consultee_name;
  var designation;
  var name;
  var local_name;

  @override
  void initState() {
    super.initState();
    initializePreferences();
  }

  Future<void> initializePreferences() async {
    prefCheckLogin = await SharedPreferences.getInstance();
    local_name = prefCheckLogin.getString("name")!;
    designation = prefCheckLogin.getString("designation")!;

    if (designation == "consultant") {
      consultee_name = name;
      consultant_name = local_name;
    } else {
      consultant_name = name;
      consultee_name = local_name;
    }

    print("Consultant name : $consultant_name");
    print("Consultee name : $consultee_name");

    getChat(context);
  }

  Future<void> getChat(BuildContext context) async {
    try {
      DB_IP a = DB_IP();
      String ip = a.getIpAddr();
      var url = Uri.parse("http://$ip/Educonsult_API/get_chat.php");

      var response = await http.post(url, body: {
        'ConsultantName': consultant_name,
        'ConsulteeName': consultee_name
      });

      if (response.body.isNotEmpty) {
        var decodedBody = jsonDecode(response.body);

        if (decodedBody is List<dynamic>) {
          setState(() {
            msg = decodedBody.cast<Map<dynamic, dynamic>>();
          });
        } else {
          print("Response body is not a List<dynamic>");
        }
      }
    } catch (e) {
      print("Fetch Consultants Error: $e");
    }
  }

  Future<void> sendMsg(BuildContext context) async {
    try {
      DB_IP a = DB_IP();
      String ip = a.getIpAddr();
      var url = Uri.parse("http://$ip/Educonsult_API/send_msg.php");

      print(sendController.text.toString());
      var response = await http.post(url, body: {
        'ConsultantName': consultant_name,
        'ConsulteeName': consultee_name,
        'Designation': designation,
        'Chat': sendController.text.toString()
      });

      if (response.body.isNotEmpty) {
        var res = (jsonDecode(response.body));

        if (res != Null) {
          setState(() {
            sendController.text = "";
          });
        } else {
          print("Problem");
        }
      }
    } catch (e) {
      print("Store message Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    name = ModalRoute.of(context)?.settings.arguments as String?;
    getChat(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: _buildAppBar(context),
        body: RefreshIndicator(
          onRefresh: () => getChat(context),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: msg.length,
                    itemBuilder: (context, index) {
                      String des = msg[index]['designation'];
                      return des == designation
                          ? Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.symmetric(
                            horizontal: 23.h,
                            vertical: 11.v,
                          ),
                          decoration: AppDecoration.fillBlue.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder14,
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 185.h,
                                margin: EdgeInsets.only(right: 12.h),
                                child: Text(
                                  msg[index]['chat'].toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 218, 225, 221),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                          : Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.symmetric(
                            horizontal: 23.h,
                            vertical: 11.v,
                          ),
                          decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder14,
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 185.h,
                                margin: EdgeInsets.only(right: 12.h),
                                child: Text(
                                  msg[index]['chat'].toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodyMedium,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomTextFormField(
                    width: MediaQuery.of(context).size.width * 0.7,
                    controller: sendController,
                    hintText: "Type here...",
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 132, 131, 131),
                    ),
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      setState(() {
                        sendMsg(context);
                      });
                    },
                    width: MediaQuery.of(context).size.width * 0.2,
                    text: "Send",

                    // lefIcon: Icon(Icons.send,size: 60,),
                  ),
                ],
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }


  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize:
      Size.fromHeight(kToolbarHeight + 10.0), // Adjust height with padding
      child: Padding(
        padding: EdgeInsets.only(top: 10.0), // Adjust top padding as needed
        child: CustomAppBar(
          leadingWidth: 44.h,
          leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 21.h, top: 19.v, bottom: 20.v),
            onTap: () {
              onTapArrowLeft(context);
            },
          ),
          title: Padding(
            padding: EdgeInsets.only(left: 21.h),
            child: Row(
              children: [
                AppbarTitleCircleimage(imagePath: ImageConstant.imgEllipse12),
                Padding(
                  padding: EdgeInsets.only(left: 10.h, bottom: 3.v),
                  child: Column(
                    children: [
                      AppbarSubtitleOne(text: "$name"),
                      SizedBox(height: 1.v),
                      AppbarSubtitleTwo(
                        text: "Online",
                        margin: EdgeInsets.only(right: 0.h),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}


