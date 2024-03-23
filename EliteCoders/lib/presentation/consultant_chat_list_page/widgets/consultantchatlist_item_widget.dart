import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';

class ConsultantchatlistItemWidget extends StatelessWidget {
  final int index;
  final List data;

  const ConsultantchatlistItemWidget({
    Key? key,
    required this.index,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = data[index]['consulteeName'] ?? '';

    return Container(
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
          Padding(
            padding: EdgeInsets.only(
              right: 7.h,
              bottom: 9.v,
            ),
            child: Column(
              children: [
                Text(
                  "15.29",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                SizedBox(height: 1.v),
                Container(
                  width: 23.adaptSize,
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.h,
                    vertical: 1.v,
                  ),
                  decoration: AppDecoration.fillPrimaryContainer.copyWith(
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
    );
  }
}
