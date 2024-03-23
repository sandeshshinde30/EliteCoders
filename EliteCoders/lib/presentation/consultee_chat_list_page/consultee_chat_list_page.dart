import 'package:educonsult/widgets/custom_search_view.dart';
import 'widgets/consulteechatlist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:educonsult/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ConsulteeChatListPage extends StatelessWidget {
  ConsulteeChatListPage({Key? key})
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
          width: double.maxFinite,
          decoration: AppDecoration.fillWhiteA,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 20.h,
                  right: 20.h,
                  top: 40.h
                ),
                child: CustomSearchView(
                  controller: searchController,
                  hintText: "Search Chat",
                ),
              ),
              SizedBox(height: 25.v),
              SizedBox(height: 21.v),
              _buildConsulteechatlist(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildConsulteechatlist(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
            )
        {
          return SizedBox(
            height: 18.v,
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return ConsulteechatlistItemWidget();
        },
      ),
    );
  }
}
