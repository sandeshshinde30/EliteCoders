import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/database_ip.dart';
import '../../../widgets/custom_elevated_button.dart';
import 'package:http/http.dart' as http;

class CollegeconsultantlistItemWidget extends StatefulWidget {
  final int index;
  final List<dynamic>? data;

  const CollegeconsultantlistItemWidget({
    Key? key,
    required this.index,
    required this.data,
  }) : super(key: key);



  @override
  _CollegeconsultantlistItemWidgetState createState() =>
      _CollegeconsultantlistItemWidgetState();
}

class _CollegeconsultantlistItemWidgetState
    extends State<CollegeconsultantlistItemWidget> {

  late String Name;

  @override
  Widget build(BuildContext context) {
    if (widget.data == null ||
        widget.data!.isEmpty ||
        widget.index < 0 ||
        widget.index >= widget.data!.length) {
      return SizedBox(); // Return an empty SizedBox if data is null, empty, or index is out of bounds
    }

    String name = widget.data![widget.index]['Name'] ?? ''; // Use null-aware operator to handle null case
    String branch =
        widget.data![widget.index]['Branch'] ?? ''; // Use null-aware operator to handle null case

    Name = name;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 9.v),
      decoration: AppDecoration.fillIndigo.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder14,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEllipse16,
            height: 50.adaptSize,
            width: 50.adaptSize,
            radius: BorderRadius.circular(25.h),
          ),
          SizedBox(height: 3.v),
          Center(
            child: Text(
              name,
              style: CustomTextStyles.labelMediumPoppinsWhiteA700,
            ),
          ),
          SizedBox(height: 1.v),
          Text(
            branch,
            style: CustomTextStyles.bodySmallWhiteA700,
          ),
          SizedBox(height: 2.v),
          _buildCONNECT(context),
          SizedBox(height: 3.v),
        ],
      ),
    );
  }

  Widget _buildCONNECT(BuildContext context) {
    String btnName = "CONNECT";
    return InkWell(

        onTap: () { setState(() { btnName = "Remove"; }); },
        child: CustomElevatedButton(
          height: 17.v,
          width: 73.h,
          text: "$btnName",
          buttonStyle: CustomButtonStyles.fillLightBlue,
          buttonTextStyle: CustomTextStyles.labelMediumPoppinsGray800,
          onPressed: () async {
            late SharedPreferences prefCheckLogin;
            prefCheckLogin  = await SharedPreferences.getInstance();
            var consultee_name = prefCheckLogin.getString("name")!;

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Are You Sure ?'),
                  actions: <Widget>[
                    TextButton(onPressed: (){
                      Navigator.of(context).pop();
                    },
                      child:Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.of(context).pop();

                        if(consultee_name!=Null)
                        {
                          print(consultee_name);
                          //name
                          try {
                            DB_IP a = DB_IP();
                            String ip = a.getIpAddr();
                            var url = Uri.parse("http://$ip/Educonsult_API/send_request.php");

                            var response = await http.post(url, body: {
                              'consultant_name' : Name,
                              'consultee_name' : consultee_name,
                              'status' : "null"
                            });

                            if (response.body.isNotEmpty) {
                              String data = jsonDecode(response.body);

                              if(data != Null)
                              {
                                print(data);
                                if(data == "true")
                                  {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Connection Request Successfully sent'),
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
                                // Navigator.pushNamed(context,'/college_consultant_list_screen',arguments: data);
                              }
                            }

                          } catch (e) {
                            print("Fetch Consultants Error: $e");
                            // Handle error appropriately
                          }
                        }
                      },
                      child: Text('Connect'),
                    ),

                  ],
                );
              },
            );


          },
        ),
    );
  }
}
