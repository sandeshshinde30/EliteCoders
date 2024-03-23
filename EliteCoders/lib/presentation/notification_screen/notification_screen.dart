import 'package:educonsult/widgets/app_bar/custom_app_bar.dart';
import 'package:educonsult/widgets/app_bar/appbar_leading_image.dart';
import 'package:educonsult/widgets/app_bar/appbar_title.dart';
import 'widgets/notificationscreen_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Padding(
                padding: EdgeInsets.only(left: 13.h, top: 24.v, right: 13.h),
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 19.v);
                    },
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return NotificationscreenItemWidget();
                    }))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 52.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 29.h, top: 21.v, bottom: 17.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "Notification"));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
