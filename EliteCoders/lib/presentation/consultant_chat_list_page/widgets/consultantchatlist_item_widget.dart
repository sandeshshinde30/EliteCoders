import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConsultantchatlistItemWidget extends StatefulWidget {
  final int index;
  final List data;

  const ConsultantchatlistItemWidget({
    Key? key,
    required this.index,
    required this.data,
  }) : super(key: key);

  @override
  _ConsultantchatlistItemWidgetState createState() =>
      _ConsultantchatlistItemWidgetState();
}

class _ConsultantchatlistItemWidgetState
    extends State<ConsultantchatlistItemWidget> {
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
    var name = widget.data[widget.index]['$type'] ?? ''; // Access data using widget

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/chat_screen', arguments: name);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.all(7),
        decoration: AppDecoration.outlinePrimaryContainer.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder14,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgEllipse12,
              height: 55.adaptSize,
              width: 55.adaptSize,
              radius: BorderRadius.circular(25),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 11.h,
                top: 11.v,
                bottom: 15.v,
              ),
              child: Text(
                "$name",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
