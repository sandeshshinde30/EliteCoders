import 'package:educonsult/presentation/consultee_chat_list_page/consultee_chat_list_page.dart';
import 'package:educonsult/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ConsulteeChatListContainerScreen extends StatelessWidget {
  ConsulteeChatListContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.consulteeChatListPage,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(routeSetting.name!),
                    transitionDuration: Duration(seconds: 0))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        // final currentContext = navigatorKey.currentContext;
        // if (currentContext != null) {
        final currentRoute = getCurrentRoute(type);
          Navigator.pushReplacementNamed(context, getCurrentRoute(type));
        // }
        // else
        //   {
        //     print("Some Problem");
        //   }
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
        return AppRoutes.consulteeChatListContainerScreen;
      case BottomBarEnum.Profile:
        return AppRoutes.consulteeProfileContainerScreen;
      default:
        return '/chat_screen';
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.consulteeChatListPage:
        return ConsulteeChatListPage();
      default:
        return DefaultWidget();
    }
  }
}
