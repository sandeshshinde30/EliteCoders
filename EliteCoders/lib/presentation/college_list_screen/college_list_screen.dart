import 'package:educonsult/presentation/consultee_chat_list_page/consultee_chat_list_page.dart';
import 'widgets/collegelist_item_widget.dart';
import 'package:educonsult/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';

class CollegeListScreen extends StatefulWidget {
  CollegeListScreen({Key? key}) : super(key: key);

  @override
  _CollegeListScreenState createState() => _CollegeListScreenState();
}

class _CollegeListScreenState extends State<CollegeListScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  late List<dynamic>? data;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as List?;
    if (data == null || data!.isEmpty) {
      // Timer(Duration(seconds:1),()=>Navigator.pushReplacementNamed(context,'/home_screen_consultant_screen'));
      return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: (){Navigator.pushReplacementNamed(context,'/home_screen_consultee_screen');},
              child: Icon(Icons.arrow_back)),
          title: Text('Colleges'),
        ),
        body: Center(
          child: Text("Coming Soon..."),
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 15.h,
            vertical: 33.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 106.h),
                child: Text(
                  "Colleges",
                  style: TextStyle(
                    color: Color.fromARGB(255, 17, 24, 52),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 37.v),
              _buildCollegelist(context),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildCollegelist(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
          context,
          index,
          ) {
        return SizedBox(
          height: 22.v,
        );
      },
      itemCount: data!.length,
      itemBuilder: (context, index) {
        return CollegelistItemWidget(
          index: index, // Pass index as named argument
          data: data,
        );
      },
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        final currentRoute = getCurrentRoute(type);
        if (currentRoute == AppRoutes.homeScreenConsulteeScreen) {
          Navigator.pushReplacementNamed(context,'/home_screen_consultee_screen');
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
      case BottomBarEnum.College:
        return AppRoutes.college_list_loader;
      case BottomBarEnum.Chat:
        return AppRoutes.consulteechatLoader;//consultee_chat_list_container_screen
      case BottomBarEnum.Profile:
        return AppRoutes.consulteeProfileContainerScreen;
      default:
        return '/';
    }
  }
}
