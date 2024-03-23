import 'package:educonsult/presentation/consultant_chat_list_page/consultant_chat_list_page.dart';
import 'package:educonsult/widgets/custom_text_form_field.dart';
import 'package:educonsult/widgets/custom_drop_down.dart';
import 'package:educonsult/widgets/custom_elevated_button.dart';
import 'package:educonsult/widgets/custom_bottom_bar_consultant.dart';
import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';

class ConsultantProfileScreen extends StatelessWidget {
  ConsultantProfileScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController twentyTwoController = TextEditingController();

  TextEditingController twentyTwoController1 = TextEditingController();

  List<String> dropdownItemList = [
    "Second Year",
    "Third Year",
    "Fourth Year"
  ];

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 17.h,
                  vertical: 15.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Profile",
                        style: TextStyle(color: Color(0xFF172452),fontSize: 30),
                      ),
                    ),
                    SizedBox(height: 12.v),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 77.v,
                        width: 75.h,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgEllipse12,
                              height: 100.adaptSize,
                              width: 100.adaptSize,
                              radius: BorderRadius.circular(
                                37.h,
                              ),
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.v),
                    Text(
                      "Name",
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 3.v),
                    _buildName(context),
                    SizedBox(height: 11.v),
                    Text(
                      "Email",
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 3.v),
                    _buildEmail(context),
                    SizedBox(height: 13.v),
                    Text(
                      "College",
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 3.v),
                    _buildTwentyTwo(context),
                    SizedBox(height: 13.v),
                    Text(
                      "Department",
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 3.v),
                    _buildTwentyTwo1(context),
                    SizedBox(height: 12.v),
                    Text(
                      "Year",
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 3.v),
                    CustomDropDown(
                      // icon: Container(
                      //   margin: EdgeInsets.fromLTRB(30.h, 16.v, 20.h, 16.v),
                      //   child: CustomImageView(
                      //     imagePath: ImageConstant.imgArrowdown,
                      //     height: 11.v,
                      //     width: 14.h,
                      //   ),
                      // ),

                      hintText: "Second Year",
                      items: dropdownItemList,
                    ),
                    SizedBox(height: 36.v),
                    _buildSaveChanges(context),
                    SizedBox(height: 6.v),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return CustomTextFormField(
      controller: nameController,
      hintText: "Enter Name",
      autofocus: false,
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      hintText: "Enter Email Id",
      textInputType: TextInputType.emailAddress,
      autofocus: false,
    );
  }

  /// Section Widget
  Widget _buildTwentyTwo(BuildContext context) {
    return CustomTextFormField(
      controller: twentyTwoController,
      hintText: "Enter College Name",
      autofocus: false,
    );
  }

  /// Section Widget
  Widget _buildTwentyTwo1(BuildContext context) {
    return CustomTextFormField(
      controller: twentyTwoController1,
      hintText: "Enter Department",
      textInputAction: TextInputAction.done,
      autofocus: false,
    );
  }

  /// Section Widget
  Widget _buildSaveChanges(BuildContext context) {
    return CustomElevatedButton(
      height: 45.v,
      width: 221.h,
      text: "Save changes",
      alignment: Alignment.center,
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        final currentRoute = getCurrentRoute(type);
        if (currentRoute == AppRoutes.homeScreenConsultantScreen) {
          Navigator.pop(context);
        } else {
          Navigator.pushReplacementNamed(context, getCurrentRoute(type));
        }
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeScreenConsultantScreen;
      case BottomBarEnum.Requests:
        return AppRoutes.request_loader;
      case BottomBarEnum.Chat:
        return AppRoutes.consultantChatListContainerScreen;
      case BottomBarEnum.Profile:
        return AppRoutes.consultantProfileScreen;
      default:
        return '/';
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.consultantChatListPage:
        return ConsultantChatListPage();
      default:
        return DefaultWidget();
    }
  }
}
