import 'package:educonsult/widgets/custom_search_view.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'widgets/consulteechatlist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ConsulteeChatListPage extends StatelessWidget {
  ConsulteeChatListPage({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

  late List<dynamic> data = [];

  @override
  Widget build(BuildContext context) {
    data = [...ModalRoute.of(context)?.settings.arguments as List? ?? []];
    if (data == null || data!.isEmpty) {
      // Timer(Duration(seconds:1),()=>Navigator.pushReplacementNamed(context,'/home_screen_consultant_screen'));
      return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: (){Navigator.pushReplacementNamed(context,'/home_screen_consultee_screen');},
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
          width: double.maxFinite,
          decoration: AppDecoration.fillWhiteA,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 20.h,
                  right: 20.h,
                  top: 40.h
                ),
                child: CustomSearchView(
                  controller: searchController,
                  hintText: "Search Chat",
                ),
              ),
              SizedBox(height: 25.v),
              SizedBox(height: 21.v),
              _buildConsulteechatlist(context),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildConsulteechatlist(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
            )
        {
          return SizedBox(
            height: 18.v,
          );
        },
        itemCount: data!.length,

        itemBuilder: (context, index) {
          return ConsulteechatlistItemWidget(
            index: index, // Pass index as named argument
            data: data,
          );
        },
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        final currentRoute = getCurrentRoute(type);
        if (currentRoute == AppRoutes.homeScreenConsultantScreen) {
          Navigator.pushReplacementNamed(context, '/home_screen_consultee_screen');
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
        return AppRoutes.homeScreenConsulteeScreen;
      case BottomBarEnum.Requests:
        return AppRoutes.college_list_loader;
      case BottomBarEnum.Chat:
        return AppRoutes.consulteechatLoader;
      case BottomBarEnum.Profile:
        return AppRoutes.consulteeProfileContainerScreen;
      default:
        return '/';
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.consultantChatListPage:
        return ConsulteeChatListPage();
      default:
        return DefaultWidget();
    }
  }
}
