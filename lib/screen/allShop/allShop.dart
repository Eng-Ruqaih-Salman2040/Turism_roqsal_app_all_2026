import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../screen/section/section_controller.dart';
import '../../apiservice/url.dart';
import '../../widget/colleges_item..dart';
import '../../widget/noitem.dart';
import 'allShop_controller.dart';
import 'item.dart';


// ignore: use_key_in_widget_constructors
class allShopScreen extends GetWidget<allShopController> {
  get alignment => null;

  @override
  Widget build(BuildContext context) {
    return controller.obx(
          (data) => data!.section!.length > 0
          ? ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (ctx, index) {
          final section = data.section![index];

          // أنيميشن لكل عنصر
          return TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: Duration(milliseconds: 400 + (index * 100)),
            builder: (context, double value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(50 * (1 - value), 0),
                  child: child,
                ),
              );
            },
            child: Item(section),
          );
        },
        itemCount: data.section!.length,
      )

      // الكود المعلّق الأصلي ما حذفته
      //     GridView.count(
      //       physics: NeverScrollableScrollPhysics(),
      //       shrinkWrap: true,
      //       // primary: false,
      //       // shrinkWrap: true,
      //       // physics: NeverScrollableScrollPhysics(),
      //       crossAxisCount: 1,
      //
      // // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      // // maxCrossAxisExtent: 200,
      // // childAspectRatio: 6/ 9,
      // // // mainAxisSpacing: 10,
      // // // crossAxisSpacing: 10,
      // // ),
      // children: data.section!.map((item) =>
      // Item(item))
      //     .toList(),
      //
      // )
          : noItem(),
    );
  }
}
