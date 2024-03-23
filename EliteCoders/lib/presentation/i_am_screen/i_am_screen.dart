import 'package:educonsult/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';

class IAmScreen extends StatelessWidget {
  const IAmScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 41.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "I am ....",
                style: theme.textTheme.displayMedium,
              ),
              SizedBox(height: 38.v),
              CustomElevatedButton(
                text: "Consultant",
                margin: EdgeInsets.only(left: 8.h),
                buttonStyle: CustomButtonStyles.fillPrimaryContainer,
                buttonTextStyle: CustomTextStyles.titleLargeWhiteA700,
              ),
              SizedBox(height: 54.v),
              CustomElevatedButton(
                text: "Consultee",
                margin: EdgeInsets.only(left: 8.h),
                buttonStyle: CustomButtonStyles.fillOnPrimaryContainer,
                buttonTextStyle: CustomTextStyles.titleLargePrimaryContainer,
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
