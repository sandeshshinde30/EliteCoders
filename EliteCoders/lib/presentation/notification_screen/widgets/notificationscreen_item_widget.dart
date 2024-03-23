import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';

// ignore: must_be_immutable
class NotificationscreenItemWidget extends StatelessWidget {
  const NotificationscreenItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.v),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 75.v,
            width: 75.h,
            margin: EdgeInsets.only(left: 10.h,right: 10.h),
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgRectangle2,
                  height: 74.v,
                  width: 74.h,
                  radius: BorderRadius.circular(
                    10.h,
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 3.v,
              bottom: 6.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200.h,
                  margin: EdgeInsets.only(left: 1.h),
                  child: Text(
                    "Request from \nAbhishek",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall,
                  ),
                ),
                SizedBox(height: 1.v),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
