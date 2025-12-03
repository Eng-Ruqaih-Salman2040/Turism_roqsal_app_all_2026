import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/menu_widget2.dart';
import '../../widget/noitem.dart';
import 'favorite_controller.dart';
import 'item.dart';


class favoriteScreen extends GetWidget<favoriteController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: kColorsPrimary,
          title: Text("favorite".tr),
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),

        ),
        drawer: drawerWidget(),
      body: controller.obx((data)
        =>  data!.shop!.length > 0 ? ListView.builder(
          itemBuilder: (ctx, index) {
    return Item (
    data.shop![index]);
    },
      itemCount: data.shop!.length,
    ):noItem(),

      )
    );
      }
        }
