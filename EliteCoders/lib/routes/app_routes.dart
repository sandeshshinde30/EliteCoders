

import 'package:flutter/material.dart';
import '../presentation/chat_screen/chat_screen.dart';
import '../presentation/college_consultant_list_screen/college_consultant_list_screen.dart';
import '../presentation/college_list_screen/college_list_loader.dart';
import '../presentation/college_list_screen/college_list_screen.dart';
import '../presentation/consultant_chat_list_container_screen/consultant_chat_list_container_screen.dart';
import '../presentation/consultant_chat_list_page/consultant_chat_list_page.dart';
import '../presentation/consultant_chat_list_page/consultant_chat_loader.dart';
import '../presentation/consultant_profile_screen/consultant_profile_screen.dart';
import '../presentation/consultee_chat_list_container_screen/consultee_chat_list_container_screen.dart';
import '../presentation/consultee_profile_container_screen/consultee_profile_container_screen.dart';
import '../presentation/home_screen_consultant_screen/home_screen_consultant_screen.dart';
import '../presentation/home_screen_consultee_screen/home_screen_consultee_screen.dart';
import '../presentation/i_am_screen/i_am_screen.dart';
import '../presentation/notification_screen/notification_screen.dart';
import '../presentation/registration_screen_consultant_screen/registration_screen_consultant_screen.dart';
import '../presentation/registration_screen_consultee_screen/registration_screen_consultee_screen.dart';
import '../presentation/request_list_screen/request_list_screen.dart';
import '../presentation/request_list_screen/request_loder.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/login_register_screen/login_register_screen.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/registration_screen/registration_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginRegisterScreen = '/login_register_screen';

  static const String loginScreen = '/login_screen';

  static const String registrationScreen = '/registration_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String chatScreen = '/chat_screen';

  static const String consulteeProfilePage = '/consultee_profile_page';

  static const String consulteeProfileContainerScreen =
      '/consultee_profile_container_screen';

  static const String notificationScreen = '/notification_screen';

  static const String homeScreenConsulteeScreen =
      '/home_screen_consultee_screen';

  static const String consulteeChatListPage = '/consultee_chat_list_page';

  static const String consulteeChatListContainerScreen =
      '/consultee_chat_list_container_screen';

  static const String collegeListScreen = '/college_list_screen';

  static const String collegeConsultantListScreen =
      '/college_consultant_list_screen';

  static const String requestListScreen = '/request_list_screen';

  static const String consultantChatListContainerScreen =
      '/consultant_chat_list_container_screen';

  static const String consultantChatListPage = '/consultant_chat_list_page';


  static const String consultantProfileScreen = '/consultant_profile_screen';

  static const String homeScreenConsultantScreen =
      '/home_screen_consultant_screen';

  static const String request_loader =
      '/request_loader';

  static const String college_list_loader =
      '/college_list_loader';

  static const String iAmScreen = '/i_am_screen';

  static const String registrationScreenConsulteeScreen =
      '/registration_screen_consultee_screen';

  static const String registrationScreenConsultantScreen =
      '/registration_screen_consultant_screen';

  static const String consultantChatLoader =
      '/consultantChatLoader';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    loginRegisterScreen: (context) => LoginRegisterScreen(),
    loginScreen: (context) => LoginScreen(),
    registrationScreen: (context) => RegistrationScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    chatScreen: (context) => ChatScreen(),
    consulteeProfileContainerScreen: (context) =>
        ConsulteeProfileContainerScreen(),
    notificationScreen: (context) => NotificationScreen(),
    homeScreenConsulteeScreen: (context) => HomeScreenConsulteeScreen(),
    consulteeChatListContainerScreen: (context) =>
        ConsulteeChatListContainerScreen(),
    collegeListScreen: (context) => CollegeListScreen(),
    collegeConsultantListScreen: (context) => CollegeConsultantListScreen(),
    requestListScreen: (context) => RequestListScreen(),
    consultantChatListContainerScreen: (context) =>
        ConsultantChatListContainerScreen(),
    consultantProfileScreen: (context) => ConsultantProfileScreen(),
    homeScreenConsultantScreen: (context) => HomeScreenConsultantScreen(),
    request_loader : (context) => RequestLoader(),
    college_list_loader : (context) => College_list_loader(),
    iAmScreen: (context) => IAmScreen(),
    registrationScreenConsulteeScreen: (context) => RegistrationScreenConsulteeScreen(),
    registrationScreenConsultantScreen: (context) => RegistrationScreenConsultantScreen(),
    consultantChatLoader : (context) => consultant_chat_loader(),
    consultantChatListPage : (context) => ConsultantChatListPage(),
  };
}
