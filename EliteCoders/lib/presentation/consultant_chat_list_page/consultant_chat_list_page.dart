import 'dart:convert';

import 'package:educonsult/widgets/custom_search_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'widgets/consultantchatlist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';
import 'package:http/http.dart' as http;


class ConsultantChatListPage extends StatefulWidget {
  const ConsultantChatListPage({Key? key}) : super(key: key);

  @override
  _ConsultantChatListPageState createState() => _ConsultantChatListPageState();
}

class _ConsultantChatListPageState extends State<ConsultantChatListPage> {
  TextEditingController searchController = TextEditingController();

  //
  // @override
  // void initState() {
  //   super.initState();
  //   initializePreferences();
  // }

  late SharedPreferences prefCheckLogin;
  var consultant_name;
  var designation;


  // Future<void> initializePreferences() async {
  //   prefCheckLogin  = await SharedPreferences.getInstance();
  //   consultant_name = prefCheckLogin.getString("name")!;
  //   designation = prefCheckLogin.getString("designation")!;
  //
  //   // print(consultant_name);
  //   // print(designation);
  //
  //   getChatData(consultant_name,designation);
  // }
  //
  //
  // Future<void> getChatData(String name, String designation) async {
  //
  //   try {
  //     var url = Uri.parse("http://192.168.52.145/Educonsult_API/see_chat_list.php");
  //
  //     var response = await http.post(url, body: {
  //       'name': consultant_name,
  //       'designation' : designation
  //     });
  //
  //     if (response.body.isNotEmpty) {
  //       data = jsonDecode(response.body);
  //
  //       if(data != Null)
  //       {
  //         print(data);
  //         setState(() {});
  //
  //       }
  //       else
  //       {
  //         print("Problem");
  //       }
  //     }
  //   } catch (e) {
  //     print("Fetch Consultants Error: $e");
  //     // Handle error appropriately
  //   }
  // }
  late List<dynamic> data = [];


  @override
  Widget build(BuildContext context) {
    data = [...ModalRoute.of(context)?.settings.arguments as List? ?? []];
    if (data == null || data!.isEmpty) {
      // Timer(Duration(seconds:1),()=>Navigator.pushReplacementNamed(context,'/home_screen_consultant_screen'));
      return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: (){Navigator.pushReplacementNamed(context,'/home_screen_consultant_screen');},
              child: Icon(Icons.arrow_back)),
          title: Text('Chats'),
        ),
        body: Center(
          child: Text("You don't have any chats"),
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: EdgeInsets.only(top: 30),
          width: double.maxFinite,
          decoration: AppDecoration.fillWhiteA,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 20.h,
                  right: 20.h,
                ),
                child: CustomSearchView(
                  autofocus: false,
                  controller: searchController,
                  hintText: "Search Chat",
                ),
              ),
              SizedBox(height: 25.v),
              SizedBox(height: 0.v),
              _buildConsultantchatlist(context),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildConsultantchatlist(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
            context,
            index,
            ) {
          return SizedBox(
            height: 10,
          );
        },
        itemCount: data!.length,
        itemBuilder: (context, index) {
          return ConsultantchatlistItemWidget(
            index: index, // Pass index as named argument
            data: data,
          );
        },
      ),
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
        return AppRoutes.consultantChatLoader;
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
