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


// ignore_for_file: must_be_immutable
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


  // List<Map> msg = [
  // {'msg': "Hii", 'designation': "consultant"},
  // {'msg': "Hello", 'designation': "consultant"},
  // {'msg': "Hii", 'designation': "consultee"},
  // {'msg': "I am Sandesh", 'designation': "consultant"},
  // {'msg': "I am Mahemud", 'designation': "consultee"}
  // ];

   late List<Map<dynamic,dynamic>> msg = [];
   var consultant_name;
   var consultee_name;
   var designation;

  @override
  void initState() {
    super.initState();
    initializePreferences();
  }

   Future<void> initializePreferences() async {
     prefCheckLogin  = await SharedPreferences.getInstance();
     consultant_name = prefCheckLogin.getString("name")!;
     designation = prefCheckLogin.getString("designation")!;

     getChat(context,consultee_name);
   }

   Future<void> getChat(BuildContext context,String consultee_name) async
   {
     try {
       DB_IP a = DB_IP();
       String ip = a.getIpAddr();
       var url = Uri.parse("http://$ip/Educonsult_API/get_chat.php");

       var response = await http.post(url, body: {
         'ConsultantName': consultant_name,
         'ConsulteeName' : consultee_name
       });


       if (response.body.isNotEmpty) {
         // msg = (jsonDecode(response.body) as List<dynamic>).cast<Map<dynamic, dynamic>>();

         var decodedBody = jsonDecode(response.body);

         msg = decodedBody.cast<Map<dynamic, dynamic>>();

         if (decodedBody is List<dynamic>) {

           if (msg != Null) {
             print(msg);
             setState(() {
               Timer? _timer;

               void startTimer() {
                 // Create a timer that calls a method every 5 seconds
                 _timer = Timer.periodic(Duration(seconds: 5), (timer) {
                   // Call your method here
                   getChat(context, consultee_name);
                 });
                 startTimer();
               }
             });
           }
           else {

           }
         }
         else
           {
             print("cant");
           }
       }
     } catch (e) {
       print("Fetch Consultants Error: $e");
       // Handle error appropriately
     }
   }

   Future<void> sendMsg(BuildContext context) async
   {
     try {
       DB_IP a = DB_IP();
       String ip = a.getIpAddr();
       var url = Uri.parse("http://$ip/Educonsult_API/send_msg.php");

       print(sendController.text.toString());
       var response = await http.post(url, body: {
         'ConsultantName': consultant_name,
         'ConsulteeName' : consultee_name,
         'Designation' : designation,
         'Chat' : sendController.text.toString()
       });


       if (response.body.isNotEmpty) {
         var res = (jsonDecode(response.body));

         if(res != Null)
         {
           setState(() {
             sendController.text = "";
           });
         }
         else
         {
           print("Problem");
         }
       }
     } catch (e) {
       print("Store message Error: $e");
       // Handle error appropriately
     }
   }

  @override
  Widget build(BuildContext context) {
    // consultee_name = [...?ModalRoute.of(context)?.settings.arguments as String? ?? []];
    consultee_name = ModalRoute.of(context)?.settings.arguments as String?;

    if(consultee_name != null) getChat(context,consultee_name);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: _buildAppBar(context),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 27.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      //_buildFiftyFive(context),
                      SizedBox(height: 9.v),

                      // Below is the code for CustomTextFormField which was given instead

                      // Padding(
                      //   padding: EdgeInsets.only(right: 2.h),
                      //   child: CustomTextFormField(
                      //     width: 158.h,
                      //     controller: imwaitingbroController,
                      //     hintText: "I'm waiting bro",
                      //     alignment: Alignment.centerRight,
                      //     contentPadding:
                      //         EdgeInsets.symmetric(horizontal: 19.h, vertical: 17.v),
                      //     borderDecoration:
                      //         TextFormFieldStyleHelper.fillPrimaryContainer,
                      //     filled: true,
                      //     fillColor: theme.colorScheme.primaryContainer,
                      //   ),
                      // ),

                      // for(int i=0;i<msg.length;i++)
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: msg.length,
                        itemBuilder: (context, index) {
                          String des = msg[index]['designation'];
                          // If number is even, display 'Even', else display 'Odd'
                          return des == "consultant"
                              ? Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              // width: 200,
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.symmetric(
                                horizontal: 23.h,
                                vertical: 11.v,
                              ),
                              decoration: AppDecoration.fillBlue.copyWith(
                                  borderRadius: BorderRadiusStyle.roundedBorder14),
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
                              // width: 200,
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.symmetric(
                                horizontal: 23.h,
                                vertical: 11.v,
                              ),
                              decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                                  borderRadius: BorderRadiusStyle.roundedBorder14),
                              child: Column(
                                children: [
                                  Container(
                                    width: 185.h,
                                    margin: EdgeInsets.only(right: 12.h),
                                    child: Text(
                                        msg[index]['chat'].toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.bodyMedium),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                    ],
                  ),
                ),
              ),
            ),
            //const Spacer(),
            //SizedBox(height: 16.v),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                CustomTextFormField(
                    //maxLines: nul,
                    width: MediaQuery.of(context).size.width * 0.7,
                    controller: sendController,
                    hintText: "Type here...",
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 132, 131, 131),
                    ),
              ),

                CustomElevatedButton(
                  onPressed: (){
                    setState(() {
                      sendMsg(context);
                    });
                  },
                    width: MediaQuery.of(context).size.width * 0.2,
                    text: "Send"

                )
              ]
            ),

          ],
        ),
      ),
    );

  }

  Align sendmsg(String msg)
  {
    i = 1;
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        // width: 200,
        padding: EdgeInsets.symmetric(
          horizontal: 23.h,
          vertical: 11.v,
        ),
        decoration: AppDecoration.fillBlue.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder14),
        child: Column(
          children: [
            Container(
              width: 185.h,
              margin: EdgeInsets.only(right: 12.h),
              child: Text(
                "$msg",
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
    );
  }

  Align receiveMsg(String msg)
  {
    i = 0;
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        // width: 200,
        padding: EdgeInsets.symmetric(
          horizontal: 23.h,
          vertical: 11.v,
        ),
        decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder14),
        child: Column(
          children: [
            Container(
              width: 185.h,
              margin: EdgeInsets.only(right: 12.h),
              child: Text(
                  "$msg",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium),
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
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
                  padding: EdgeInsets.only(left: 13.h, bottom: 3.v),
                  child: Column(
                    children: [
                      AppbarSubtitleOne(text: "$consultee_name"),
                      SizedBox(height: 1.v),
                      AppbarSubtitleTwo(
                        text: "Online",
                        margin: EdgeInsets.only(right: 40.h),
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

  /// Section Widget
  // Widget _buildFiftyFive(BuildContext context) {
  //   return Align(
  //       alignment: Alignment.center,
  //       child: Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 15.h),
  //           child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
  //             Padding(
  //                 padding: EdgeInsets.only(top: 9.v, bottom: 10.v),
  //                 child: SizedBox(width: 120.h, child: Divider())),
  //             Padding(
  //                 padding: EdgeInsets.only(left: 9.h),
  //                 child: Text("Today", style: theme.textTheme.bodyMedium)),
  //             Padding(
  //                 padding: EdgeInsets.symmetric(vertical: 9.v),
  //                 child: SizedBox(width: 122.h, child: Divider(indent: 6.h)))
  //           ])));
  // }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
