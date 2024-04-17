import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ConsulteechatlistItemWidget extends StatefulWidget {
  final int index;
  final List data;

  const ConsulteechatlistItemWidget({
    Key? key,
    required this.index,
    required this.data,
  }) : super(key: key);

  @override
  _ConsulteechatlistItemWidgetState createState() =>
      _ConsulteechatlistItemWidgetState();
}

class _ConsulteechatlistItemWidgetState
    extends State<ConsulteechatlistItemWidget> {

  late SharedPreferences prefCheckLogin;
  var designation;
  late String type = ''; // Initialize type here

  @override
  void initState() {
    super.initState();
    initializePreferences();
  }

  Future<void> initializePreferences() async {
    prefCheckLogin = await SharedPreferences.getInstance();
    designation = prefCheckLogin.getString("designation")!;
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {

    if (designation == "consultee") {
      type = "consultantName";
    } else {
      type = "consulteeName";
    }
    print(type);
    var name = widget.data[widget.index]['$type'] ?? '';

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/chat_screen',arguments: name);
      },
      child: Container(
        padding: EdgeInsets.all(7.h),
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: AppDecoration.outlineIndigo.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder14,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/chat_screen');
              },
              child: CustomImageView(
                imagePath: ImageConstant.imgEllipse12,
                height: 50.adaptSize,
                width: 50.adaptSize,
                radius: BorderRadius.circular(
                  25,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 6,
                bottom: 10.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Esther Howard",
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(
                    "College Of Engineering Pune",
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(
                right: 7,
                bottom: 9.v,
              ),
              child: Column(
                children: [
                  Text(
                    "15.29",
                    style: theme.textTheme.bodySmall,
                  ),
                  SizedBox(height: 1.v),
                  Container(
                    width: 23.adaptSize,
                    padding: EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 1.v,
                    ),
                    decoration: AppDecoration.fillIndigo.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder11,
                    ),
                    child: Text(
                      "2",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
