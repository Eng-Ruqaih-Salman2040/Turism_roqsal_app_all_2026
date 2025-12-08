import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../router/custom_router.dart';
import '../../router/route_constants.dart';
import '../../screen/shop/shop_controller.dart';
import '../../screen/shop_details/shop_details_controller.dart';

import '../../Constants.dart';
import '../../widget/dailog_widget.dart';
import '../../widget/my_data.dart';
import '../favorite/favorite_controller.dart';
import '../login/login_model.dart';
import 'details.dart';
import 'item.dart';


// ignore: use_key_in_widget_constructors
class shop_detailsScreen extends GetWidget<ShopDetailsController> {

  var data;
  shop_detailsScreen(this.data);





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

            title: Text(this.data.nameShop),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              IconButton(
                tooltip: 'التقييمات',
                icon: const Icon(Icons.star_rate),
                onPressed: () {
                  final id = this.data.id;
                  Get.toNamed(
                    RoutingApp.ratingRoute,
                    arguments: {
                      'shopId': (id is int) ? id : int.tryParse(id.toString()) ?? 0,
                      'shopName': this.data.nameShop?.toString(),
                    },
                  );
                },
              ),
              controller.obx((data)
              => data!.favorite == true ?IconButton(
                icon: const Icon(Icons.favorite,color: Colors.red),
                onPressed: () {
                  if(MyData.auth_user){
                    late LoginModel loginModle = LoginModel.fromJson(GetStorage().read('store'));

                    Get.put(FavoriteController()).deleteFavorite(this.data.id,loginModle.id.toString(),this.data);

                  }else {
                    GetSnackMsg(msg: "يجب تسجيل الدخول لاستكمال العملية",
                        bgClr: kColorRed,
                        txClr: kColorsWhite).showTxt();

                  }

                },
              ):IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {
                  if(MyData.auth_user){
                    late LoginModel loginModle = LoginModel.fromJson(GetStorage().read('store'));

                    Get.put(FavoriteController()).addFavorite(this.data.id,loginModle.id.toString(),this.data);

                  }else {
                    GetSnackMsg(msg: "يجب تسجيل الدخول لاستكمال العملية",
                        bgClr: kColorRed,
                        txClr: kColorsWhite).showTxt();

                  }

                },
              )

              ),

            ]
            ),
      body: controller.obx((data)
        => SliderImageHeaderRoute(this.data,data!.gallery)

    ),


    );
      }
        }


