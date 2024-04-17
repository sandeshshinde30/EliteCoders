import 'dart:convert';

import 'package:educonsult/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/database_ip.dart';


class consulteeChatLoader extends StatefulWidget {
  const consulteeChatLoader({super.key});

  @override
  State<consulteeChatLoader> createState() => _consulteeChatLoaderState();
}

class _consulteeChatLoaderState extends State<consulteeChatLoader> {

  late SharedPreferences prefCheckLogin;
  var consultant_name;
  var designation;
  late List<dynamic> data;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => Center(
          child: CircularProgressIndicator(
            color: Color(0xFF169BD7),
          ),
        ),
      );
    });
    initializePreferences();
  }

  Future<void> initializePreferences() async {
    prefCheckLogin  = await SharedPreferences.getInstance();
    consultant_name = prefCheckLogin.getString("name")!;
    designation = prefCheckLogin.getString("designation")!;
    if(consultant_name!=Null)
    {
      getChatData(consultant_name,designation);
    }
  }

  Future<void> getChatData(String name, String designation) async {

    try {
      DB_IP a = DB_IP();
      String ip = a.getIpAddr();
      var url = Uri.parse("http://$ip/Educonsult_API/see_chat_list.php");

      var response = await http.post(url, body: {
        'name': consultant_name,
        'designation' : designation
      });

      if (response.body.isNotEmpty) {
        data = jsonDecode(response.body);

        if(data != Null)
        {
          print(data);
          Navigator.pushReplacementNamed(context, '/consultee_chat_list_page',arguments: data);
        }
        else
        {
          print("Problem");
        }
      }
    } catch (e) {
      print("Fetch Consultants Error: $e");
      // Handle error appropriately
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent, // Set scaffold background color to transparent
        body: Container(), // Your actual screen content goes here
      ),
    );
  }
}
