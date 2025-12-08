import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants.dart';
import '../../apiservice/api_service.dart';
import '../shop_details/shop_details_controller.dart';
import '../shop_details/shop_details.dart';
import 'favorite_model.dart';
import '../../widget/dailog_widget.dart';

class FavoriteController extends GetxController with StateMixin<FavoriteModel> {
  FavoriteModel? model;

  @override
  void onInit() {
    super.onInit();
  }

  void deleteFavorite(String shopId, String customerId, dynamic data) {
    Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);

    ApiService().postDataForm(
      url: '?checkopration=delete_favorite&shop_id=$shopId&customers_id=$customerId',
    ).then((value) {
      Get.back();

      if (value.statusCode == 200) {
        try {
          final response = FavoriteModel.fromJson(json.decode(value.data));
          if (response.success == true) {
            GetSnackMsg(
              msg: 'تم حذفة من المفضلة'.tr,
              bgClr: Colors.green,
              txClr: kColorsWhite,
            ).showTxt();

            getFavoriteApi(customerId);
            Get.find<ShopDetailsController>().getGalleryApi(shopId, customerId);
            Get.to(() => shop_detailsScreen(data));
          } else {
            GetSnackMsg(
              msg: response.message ?? 'Failed to remove from favorites',
              bgClr: Colors.red,
              txClr: kColorsWhite,
            ).showTxt();
          }
        } catch (e) {
          print("Error parsing JSON in deleteFavorite: $e");
        }
      }
    }).catchError((error) {
      Get.back();
      GetSnackMsg(
        msg: 'Network error: Please check your connection',
        bgClr: Colors.red,
        txClr: kColorsWhite,
      ).showTxt();
    });
  }

  void addFavorite(String shopId, String customerId, dynamic data) {
    Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);

    ApiService().postDataForm(
      url: '?checkopration=add_favorite&shop_id=$shopId&customers_id=$customerId',
    ).then((value) {
      Get.back();

      if (value.statusCode == 200) {
        try {
          final response = FavoriteModel.fromJson(json.decode(value.data));
          if (response.success == true) {
            GetSnackMsg(
              msg: 'تم اضافة الى المفضلة'.tr,
              bgClr: Colors.green,
              txClr: kColorsWhite,
            ).showTxt();

            getFavoriteApi(customerId);
            Get.find<ShopDetailsController>().getGalleryApi(shopId, customerId);
            Get.to(() => shop_detailsScreen(data));
          } else {
            GetSnackMsg(
              msg: response.message ?? 'Failed to add to favorites',
              bgClr: Colors.red,
              txClr: kColorsWhite,
            ).showTxt();
          }
        } catch (e) {
          print("Error parsing JSON in addFavorite: $e");
        }
      }
    }).catchError((error) {
      Get.back();
      GetSnackMsg(
        msg: 'Network error: Please check your connection',
        bgClr: Colors.red,
        txClr: kColorsWhite,
      ).showTxt();
    });
  }

  void getFavoriteApi(String customerId) {
    change(null, status: RxStatus.loading());

    ApiService()
        .getData('?checkopration=load_Data_shop_favorite&customers_id=$customerId')
        .then((value) {
      if (value.statusCode == 200) {
        try {
          final data = FavoriteModel.fromJson(json.decode(value.data));
          change(data, status: RxStatus.success());
        } catch (e) {
          change(null, status: RxStatus.error("Parsing Error"));
        }
      } else {
        change(null, status: RxStatus.error("Server Error"));
      }
    }).catchError((error) {
      change(null, status: RxStatus.error("Network Error"));
    });
  }
}
