import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class College_list_loader extends StatefulWidget {
  const College_list_loader({Key? key}) : super(key: key);

  @override
  State<College_list_loader> createState() => _College_list_loaderState();
}

class _College_list_loaderState extends State<College_list_loader> {

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
    fetchCollegeList(context);
  }

  Future<void> fetchCollegeList(BuildContext context) async
  {
    try {
      var url = Uri.parse("http://192.168.52.145/Educonsult_API/list_colleges.php");

      var response = await http.get(url);

      var data;
      if (response.body.isNotEmpty) {
        data = jsonDecode(response.body);

        if(data != Null)
        {
          print(data);
            Navigator.pushReplacementNamed(context,'/college_list_screen',arguments: data);
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
