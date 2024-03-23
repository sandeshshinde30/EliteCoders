import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'widgets/collegeconsultantlist_item_widget.dart';

late List<dynamic>? data;

class CollegeConsultantListScreen extends StatelessWidget {

  const CollegeConsultantListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as List?;
    if (data == null || data!.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('No data available'),
        ),
      );
    }

    String collegeName = data![0]['College'];

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: 312.h,
          margin: EdgeInsets.fromLTRB(24.h, 19.v, 24.h, 5.v),
          padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 22.v),
          decoration: AppDecoration.outlineBlackF
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 300.h,
                child: Text(
                  "$collegeName",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.titleMediumIndigo900,
                ),
              ),
              SizedBox(height: 38.v),
              _buildCollegeconsultantlist(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCollegeconsultantlist(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 1.h),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 125.v,
          crossAxisCount: 2,
          mainAxisSpacing: 23.h,
          crossAxisSpacing: 23.h,
        ),
        physics: NeverScrollableScrollPhysics(),
        itemCount: data!.length, // Use data length as itemCount
        itemBuilder: (context, index) {
          return CollegeconsultantlistItemWidget(
            index: index, // Pass index as named argument
            data: data,    // Pass data as named argument
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 49.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 26.h, top: 19.v, bottom: 19.v),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      centerTitle: true,
      title: Stack(
        alignment: Alignment.center,
        children: [
          AppbarTitle(text: "Consultants"),
        ],
      ),
    );
  }

  void onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
