import 'dart:convert';

import 'package:educonsult/presentation/college_consultant_list_screen/college_consultant_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../core/database_ip.dart';

class CollegelistItemWidget extends StatelessWidget {
  final int index;
  final List? data;

  const CollegelistItemWidget({Key? key, required this.index, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String collegeName = data![index]['College'] ?? '';
    String collegeID = data![index]['CollegeCode'] ?? '';
    return InkWell(
      onTap: () {
        fetchConsultants(context, collegeID);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Color(0xFF169BD7), width: 2),
          color: Colors.transparent,
        ),
        child: Row(
          children: [
            _buildCollegeID(context, collegeID),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 8),
                child: Text(
                  collegeName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black,fontSize: 13),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCollegeID(BuildContext context, String collegeID) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xFF169BD7),
      ),
      child: Center(
        child: Text(
          collegeID,
          style: TextStyle(color: Colors.white),
        ),
      ),
      margin: EdgeInsets.only(top: 1),
    );
  }

  Future<void> fetchConsultants(BuildContext context, String collegeID) async {
    try {
      DB_IP a = DB_IP();
      String ip = a.getIpAddr();
      print(ip);
      var url = Uri.parse("http://$ip/Educonsult_API/fetch_consultants.php");

      var response = await http.post(url, body: {
        'CollegeID': collegeID,
      });

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);

        if (data.isNotEmpty) {
          Navigator.pushNamed(context, '/college_consultant_list_screen', arguments: data);
        } else {
          print("No consultants found for this college.");
        }
      } else {
        print("Failed to fetch consultants. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Fetch Consultants Error: $e");
      // Handle error appropriately
    }
  }
}
