import 'dart:convert';

import 'package:educonsult/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../core/database_ip.dart';


class RequestlistItemWidget extends StatefulWidget {
  final int index;
  final List? data;

  const RequestlistItemWidget({Key? key, required this.index, this.data})
      : super(key: key);

  @override
  _RequestlistItemWidgetState createState() => _RequestlistItemWidgetState();
}

class _RequestlistItemWidgetState extends State<RequestlistItemWidget> {

  @override
  void initState() {
    super.initState();
    initializePreferences();
  }

  late SharedPreferences prefCheckLogin;
  var consultant_name;
  late String consulteeName;
  late String designation;

  Future<void> initializePreferences() async {
    prefCheckLogin  = await SharedPreferences.getInstance();
    consultant_name = prefCheckLogin.getString("name")!;
    designation = prefCheckLogin.getString("designation")!;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data == null ||
        widget.data!.isEmpty ||
        widget.index < 0 ||
        widget.index >= widget.data!.length) {
      return SizedBox(); // Return an empty SizedBox if data is null, empty, or index is out of bounds
    }

    consulteeName = widget.data![widget.index]['consulteeName'] ?? '';
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 26.h,
        vertical: 15.v,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgEllipse12,
                  height: 50.adaptSize,
                  width: 50.adaptSize,
                  radius: BorderRadius.circular(
                    25.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 17.h,
                    bottom: 5.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15,),
                       Text(
                        '$consulteeName',
                        style: TextStyle(
                          color: Color.fromRGBO(17, 24, 52, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 3.v),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 9.v),
          Padding(
            padding: EdgeInsets.only(right: 21.h),
            child: Row(
              children: [
                _buildReject(context),
                _buildAccept(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildReject(BuildContext context) {
    return CustomOutlinedButton(
      width: 123.h,
      text: "Accept",
      buttonStyle: const ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll(Color.fromRGBO(16, 26, 78, 1)),
      ),

      onPressed: () async {
        await fetchRequest(context, "Accept");
      },
    );
  }

  /// Section Widget
  Widget _buildAccept(BuildContext context) {
    return CustomOutlinedButton(
      width: 123.h,
      text: "Reject",
      margin: EdgeInsets.only(left: 10.h),
      buttonTextStyle: theme.textTheme.titleSmall!,
      onPressed: () async {
        await fetchRequest(context, "Reject");
      },
    );
  }


// Accept and Reject Button click API calling function
  Future<void> fetchRequest(BuildContext context,String status) async {
    var data;
    try {
      DB_IP a = DB_IP();
      String ip = a.getIpAddr();
      var url = Uri.parse("http://$ip/Educonsult_API/accept_reject_request.php");

      var response = await http.post(url, body: {
        'ConsultantName': consultant_name,
        'ConsulteeName': consulteeName,
        'Status' : status,
        'designation': designation
      });

      if (response.body.isNotEmpty) {
        data = jsonDecode(response.body);

        print(data);
        print(status);

        var title = "";
        var content = "";

        if (data.containsKey("message")) {
          if(status == "Accept")
            {
              await createTable(context);
              title = "Request Accepted";
              content = "The request has been successfully accepted.";
            }
          else
            {
              title = "Request Rejected";
              content = "The request has been successfully rejected.";
            }
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('$title'),
                content: Text('$content'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pushReplacementNamed(context,'/request_loader');// Close the dialog
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Request Error'),
                content: Text('There was a problem accepting the request.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pushReplacementNamed(context,'/request_loader');// Close the dialog
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      }
    } catch (e) {
      print("Fetch Consultants Error: $e");
      // Handle error appropriately
    }
  }

  Future<void> createTable(BuildContext context) async {
    var data;
    try {
      DB_IP a = DB_IP();
      String ip = a.getIpAddr();
      var url = Uri.parse("http://$ip/Educonsult_API/create_chat_table.php");

      var response = await http.post(url, body: {
        'ConsultantName': consultant_name,
        'ConsulteeName': consulteeName
      });

      if (response.body.isNotEmpty) {
        data = jsonDecode(response.body);

        print(data);

        var title = "";
        var content = "";

        if (data.containsKey("message")) {
             print("Table Created");
        }
      }
    } catch (e) {
      print("Table Creation failed: $e");
      // Handle error appropriately
    }
  }

}



