import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/menu_widget2.dart';
import '../../widget/noitem.dart';
import '../allShop/item.dart';
import 'favorite_controller.dart';
import 'item.dart' hide Item;

class FavoriteScreen extends GetWidget<FavoriteController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("favorite".tr),
      ),
      drawer: drawerWidget(),
      body: controller.obx(
            (data) => data!.shop!.isNotEmpty
            ? ListView.builder(
          itemCount: data.shop!.length,
          itemBuilder: (ctx, index) {
            return Item(data.shop![index]);
          },
        )
            : noItem(),
      ),
    );
  }
}
