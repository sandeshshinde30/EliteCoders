import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';
import 'package:educonsult/widgets/custom_drop_down.dart';
import 'package:educonsult/widgets/custom_text_form_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../../widgets/custom_elevated_button.dart';

class RegistrationScreenConsultantScreen extends StatefulWidget {
  RegistrationScreenConsultantScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenConsultantScreenState createState() =>
      _RegistrationScreenConsultantScreenState();
}

class _RegistrationScreenConsultantScreenState
    extends State<RegistrationScreenConsultantScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  TextEditingController refreshController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late String selectedYear;
  TextEditingController confirmpasswordController = TextEditingController();
  List<String> dropdownItemList = ["Second Year", "Third Year", "Fourth Year"];
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  File? imagePathID;
  String? imageNameID;
  String? imageDataID;
  File? imagePathResume;
  String? imageNameResume;
  String? imageDataResume;

  ImagePicker imagePicker = new ImagePicker();

  bool checkRegistrationFieldsnotEmpty()
  {
     if(nameController.text.toString().isEmpty)
       {
         alert("Please enter name!!");
         return false;
       }
     else if(emailController.text.toString().isEmpty)
     {
       alert("Please enter email!!");
       return false;
     }
     else if(collegeController.text.toString().isEmpty)
     {
       alert("Please enter college!!");
       return false;
     }
     else if(branchController.text.toString().isEmpty)
     {
       alert("Please enter branch!!");
       return false;
     }
     else if(passwordController.text.toString().isEmpty)
     {
       alert("Please enter password!!");
       return false;
     }
     else if(confirmpasswordController.text.toString().isEmpty)
     {
       alert("Please re-enter password!!");
       return false;
     }
     else if(imageNameID == null)
     {
       alert("Please select your college ID image!!");
       return false;
     }
     else if(imageNameResume == null)
     {
       alert("Please select your resume!!");
       return false;
     }
     else return true;
  }

  void alert(String content)
  {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text('$content'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void RegistrationSuccessalert(String content)
  {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text('$content'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> getImage() async {
    var getimage = await imagePicker.pickImage(source: ImageSource.gallery);


    setState(() {
      imagePathID = File(getimage!.path);
      imageNameID = getimage.path.split('/').last;
      imageDataID = base64Encode(imagePathID!.readAsBytesSync());
      print(imagePathID);
      print(imageNameID);
      print(imageDataID);
    });
  }

  Future<void> getImageResume() async {
    var getimage = await imagePicker.pickImage(source: ImageSource.gallery);


    setState(() {
      imagePathResume = File(getimage!.path);
      imageNameResume = getimage.path.split('/').last;
      imageDataResume = base64Encode(imagePathResume!.readAsBytesSync());
      print(imagePathResume);
      print(imageNameResume);
      print(imageDataResume);
    });
  }

  Future<void> uploadImage() async
  {
    try{
      var url = Uri.parse("http://192.168.52.145/EduConsult_API/upload_consultant_reg_details.php");

      print(nameController.text.toString());
      print(emailController.text.toString());
      print(collegeController.text.toString());
      print(branchController.text.toString());
      print(passwordController.text.toString());
      print(selectedYear);
      // print(imageNameID);
      // print(imageDataID);
      print(imageNameResume);
      print(imageDataResume);

      var response = await http.post(url, body: {
        'consultant_name' : nameController.text.toString(),
        'consultant_email' : emailController.text.toString(),
        'consultant_college' : collegeController.text.toString(),
        'consultant_branch' : branchController.text.toString(),
        'consultant_year' : selectedYear,
        'consultant_password' : passwordController.text.toString(),
        'consultant_ID_img_name': imageNameID,
        'consultant_ID_img': imageDataID,
        'consultant_Resume_img' : imageDataResume,
        'consultant_Resume_img_name' : imageNameResume

      });

      if (response.body.isNotEmpty) {
        var res = jsonDecode(response.body);

        if (res.containsKey("error")) {
          // Handle error
          print("Error: ${res["error"]}");
          RegistrationSuccessalert("Error while Registration, Please try again..");

        } else if (res.containsKey("message")) {
          // Handle success
          print("Success: ${res["message"]}");
          RegistrationSuccessalert("Registration Successfull");

        }
      }

    }
    catch(e){print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 26.h,
                  vertical: 42.v,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 47.h),
                        child: Text(
                          "Create Account",
                          style: theme.textTheme.headlineSmall,
                        ),
                      ),
                    ),
                    SizedBox(height: 37.v),
                    _buildName(context),
                    SizedBox(height: 16.v),
                    _buildEmail(context),
                    SizedBox(height: 16.v),
                    _buildCollege(context),
                    SizedBox(height: 18.v),
                    _buildBranch(context),
                    SizedBox(height: 16.v),
                    _buildRefresh(context),
                    SizedBox(height: 16.v),
                    _buildPassword(context),
                    SizedBox(height: 14.v),
                    _buildConfirmpassword(context),
                    SizedBox(height: 21.v),
                    _buildTwentyFour(context),
                    SizedBox(height: 2.v),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 82.h,
                          right: 10.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "*only jpeg",
                              style: theme.textTheme.labelMedium,
                            ),
                            Text(
                              "*only jpeg",
                              style: theme.textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 19.v),
                    _buildSignUp(context),
                    SizedBox(height: 33.v),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context,'/login_screen');
                      },
                      child: Text(
                        "Already have an account",
                        style: CustomTextStyles.titleMediumOnPrimary,
                      ),
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return CustomTextFormField(
      controller: nameController,
      hintText: "Name",
      textInputType: TextInputType.visiblePassword,
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      width: 303.h,
      controller: emailController,
      hintText: "Email",
      textInputType: TextInputType.emailAddress,
      alignment: Alignment.center,
    );
  }

  /// Section Widget
  Widget _buildCollege(BuildContext context) {
    return CustomTextFormField(
      controller: collegeController,
      hintText: "College",
    );
  }

  /// Section Widget
  Widget _buildBranch(BuildContext context) {
    return CustomTextFormField(
      controller: branchController,
      hintText: "Branch",
    );
  }

  // /// Section Widget
  // Widget _buildRefresh(BuildContext context) {
  //   return CustomDropDown(
  //     hintText: "Second Year",
  //     items: dropdownItemList,
  //   );
  // }
  Widget _buildRefresh(BuildContext context) {
    selectedYear = dropdownItemList.first; // Initialize selected year

    return CustomDropDown(
      hintText: "Second Year",
      items: dropdownItemList,
      onChanged: (String? value) {
        setState(() {
          selectedYear = value ?? dropdownItemList.first; // Update selected year
        });
      },
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
      controller: passwordController,
      hintText: "Password",
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
    );
  }

  /// Section Widget
  Widget _buildConfirmpassword(BuildContext context) {
    return CustomTextFormField(
      controller: confirmpasswordController,
      hintText: "ConfirmPassword",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
    );
  }

  /// Section Widget
  Widget _buildIDPhoto(BuildContext context) {
    return Expanded(
      child: CustomElevatedButton(
        height: 44.v,
        text: "ID Photo",
        margin: EdgeInsets.only(right: 9.h),
        rightIcon: Container(
          margin: EdgeInsets.only(left: 15.h),
          child: CustomImageView(
            imagePath : ImageConstant.imgUserBlueGray900,
            height: 20.adaptSize,
            width: 20.adaptSize,
          ),
        ),
        buttonStyle: CustomButtonStyles.fillBlue,
        buttonTextStyle: theme.textTheme.titleMedium!,
        onPressed: () {
          getImage();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildResume(BuildContext context) {
    return Expanded(
      child: CustomElevatedButton(
        height: 44.v,
        text: "Resume",
        margin: EdgeInsets.only(left: 9.h),
        rightIcon: Container(
          margin: EdgeInsets.only(left: 19.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgUserBlueGray900,
            height: 20.adaptSize,
            width: 20.adaptSize,
          ),
        ),
        buttonStyle: CustomButtonStyles.fillBlue,
        buttonTextStyle: theme.textTheme.titleMedium!,
        onPressed: (){
          getImageResume();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildTwentyFour(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 5.h,
        right: 8.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIDPhoto(context),
          _buildResume(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSignUp(BuildContext context) {
    return CustomElevatedButton(
      onPressed: (){
        print("sign up");
        setState(() {
          bool res = checkRegistrationFieldsnotEmpty();
          if(res) uploadImage();
        });
      },
      height: 50.v,
      text: "Sign up",
    );
  }
}
