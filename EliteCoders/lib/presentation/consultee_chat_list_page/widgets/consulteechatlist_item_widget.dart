import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';

// ignore: must_be_immutable
class ConsulteechatlistItemWidget extends StatelessWidget {
  const ConsulteechatlistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Navigator.pushNamed(context,'/chat_screen');},
      child: Container(
        padding: EdgeInsets.all(7.h),
        margin: EdgeInsets.only(left: 10,right: 10),
        decoration: AppDecoration.outlineIndigo.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder14,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){Navigator.pushNamed(context,'/chat_screen');},
              child: CustomImageView(
                imagePath: ImageConstant.imgEllipse12,
                height: 50.adaptSize,
                width: 50.adaptSize,
                radius: BorderRadius.circular(
                  25.h,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 6.h,
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
                right: 7.h,
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
                      horizontal: 6.h,
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
