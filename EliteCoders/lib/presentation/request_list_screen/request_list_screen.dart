import 'dart:async';

import 'package:flutter/material.dart';
import 'package:educonsult/widgets/custom_bottom_bar_consultant.dart';
import 'widgets/requestlist_item_widget.dart';
import 'package:educonsult/core/app_export.dart';

class RequestListScreen extends StatefulWidget {
  RequestListScreen({Key? key}) : super(key: key);

  @override
  _RequestListScreenState createState() => _RequestListScreenState();
}

class _RequestListScreenState extends State<RequestListScreen> {
  late List<dynamic>? data;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as List?;
    if (data == null || data!.isEmpty) {
      // Timer(Duration(seconds:1),()=>Navigator.pushReplacementNamed(context,'/home_screen_consultant_screen'));
      return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: (){Navigator.pushReplacementNamed(context,'/home_screen_consultant_screen');},
              child: Icon(Icons.arrow_back)),
          title: Text('Requests'),
        ),
        body: Center(
          child: Text("You don't have any request"),
        ),
      );
    }
    return WillPopScope(
      onWillPop: () async {
        // Navigate to the home route when the back button is pressed
        Navigator.pushReplacementNamed(context, '/home_screen_consultant_screen');
        return false; // Prevent default back navigation
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 15.h,
              vertical: 43.v,
            ),
            child: Column(
              children: [
                const Text(
                  "Requests",
                  style: TextStyle(
                      color: Color.fromARGB(255, 17, 24, 52),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 18.v),
                _buildRequestlist(context),
              ],
            ),
          ),
          bottomNavigationBar: _buildBottomBar(context),
        ),
      ),
    );
  }

  // Section Widget
  Widget _buildRequestlist(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 1.h),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
              context,
              index,
              ) {
            return SizedBox(
              height: 20.v,
            );
          },
          itemCount: data!.length,
          itemBuilder: (context, index) {
            return RequestlistItemWidget(
              index: index, // Pass index as named argument
              data: data,
            );
          },
        ),
      ),
    );
  }

  // Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        final currentRoute = getCurrentRoute(type);
        if (currentRoute == AppRoutes.homeScreenConsultantScreen) {
          Navigator.pushReplacementNamed(context, '/home_screen_consultant_screen');
        } else {
          Navigator.pushReplacementNamed(context,'/home_screen_consultant_screen');
        }
      },
    );
  }

  // Handling route based on bottom click actions
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
}


