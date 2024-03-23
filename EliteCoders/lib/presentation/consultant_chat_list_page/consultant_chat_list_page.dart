import 'package:educonsult/widgets/custom_search_view.dart';
import 'widgets/consultantchatlist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ConsultantChatListPage extends StatelessWidget {
  ConsultantChatListPage({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: EdgeInsets.only(top: 30),
          width: double.maxFinite,
          decoration: AppDecoration.fillWhiteA,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 20.h,
                  right: 20.h,
                ),
                child: CustomSearchView(
                  autofocus: false,
                  controller: searchController,
                  hintText: "Search Chat",
                ),
              ),
              SizedBox(height: 25.v),
              // Divider(
              //   color: appTheme.blueGray50,
              //   height: 5,
              //   indent: 10.h,
              //   endIndent: 10.h,
              // ),
              SizedBox(height: 0.v),
              _buildConsultantchatlist(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildConsultantchatlist(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            height: 10,
          );
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          return ConsultantchatlistItemWidget();
        },
      ),
    );
  }
}
