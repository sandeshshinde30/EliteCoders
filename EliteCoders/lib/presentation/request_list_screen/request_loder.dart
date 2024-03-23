import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class RequestLoader extends StatefulWidget {
  const RequestLoader({Key? key}) : super(key: key);

  @override
  State<RequestLoader> createState() => _RequestLoaderState();
}

class _RequestLoaderState extends State<RequestLoader> {
  late SharedPreferences prefCheckLogin;
  var consultant_name = "";
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
    if(consultant_name!=Null)
    {
      fetchRequest(context);
    }
  }

  Future<void> fetchRequest(BuildContext context) async
  {
    try {
      var url = Uri.parse("http://192.168.52.145/Educonsult_API/see_requests.php");

      var response = await http.post(url, body: {
        'ConsultantName': consultant_name, // Assuming '6007' is the hardcoded college ID
      });


      if (response.body.isNotEmpty) {
        data = jsonDecode(response.body);

        if(data != Null)
        {
          Navigator.pushReplacementNamed(context,'/request_list_screen',arguments: data);
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
    // Set the background color of the entire screen to white
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent, // Set scaffold background color to transparent
        body: Container(), // Your actual screen content goes here
      ),
    );
  }
}
