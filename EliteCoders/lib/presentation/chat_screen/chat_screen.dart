import 'dart:collection';

import 'package:educonsult/widgets/app_bar/custom_app_bar.dart';
import 'package:educonsult/widgets/app_bar/appbar_leading_image.dart';
import 'package:educonsult/widgets/app_bar/appbar_title_circleimage.dart';
import 'package:educonsult/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:educonsult/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:educonsult/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';
import 'package:flutter/widgets.dart';

// ignore_for_file: must_be_immutable
class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  TextEditingController imwaitingbroController = TextEditingController();

  TextEditingController typehereController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      Align(
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
                                child: const Text(
                                  "I'm waiting bro",
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
                      ),

                      SizedBox(height: 12.v),

                      Align(
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
                                    "Hi Frank do you watch NBA match last night?",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodyMedium),
                              )
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 12.v),

                      Align(
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
                                child: const Text(
                                  "I'm waiting bro",
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
                      ),

                      SizedBox(height: 12.v),

                      Align(
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
                                    "Hi Frank do you watch NBA match last night?",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodyMedium),
                              )
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 12.v),

                      Align(
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
                                child: const Text(
                                  "I'm waiting bro",
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
                      ),

                      SizedBox(height: 12.v),

                      Align(
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
                                    "Hi Frank do you watch NBA match last night?",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodyMedium),
                              )
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 12.v),

                      Align(
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
                                child: const Text(
                                  "I'm waiting bro",
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
                      ),

                      SizedBox(height: 12.v),

                      Align(
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
                                    "Hi Frank do you watch NBA match last night?",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodyMedium),
                              )
                            ],
                          ),
                        ),
                      ),







                    ],
                  ),
                ),
              ),
            ),
            //const Spacer(),
            //SizedBox(height: 16.v),
            Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h,bottom: 10),
              child: CustomTextFormField(
                  //maxLines: null,
                  controller: typehereController,
                  hintText: "Type here...",
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 132, 131, 131),
                  ),
                  textInputAction: TextInputAction.newline),
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
                      AppbarSubtitleOne(text: "Robert Fox"),
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
