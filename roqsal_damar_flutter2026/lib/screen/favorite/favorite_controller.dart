/*

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apiservice/checkInterNet.dart';
import '../../screen/section/section_model.dart';
import '../../screen/shop/shop_model.dart';

import '../../Constants.dart';
import '../../apiservice/api_service.dart';
import '../../apiservice/url.dart';
import '../../router/route_constants.dart';
import '../../widget/dailog_widget.dart';
import '../../widget/my_data.dart';
import '../shop_details/shop_details.dart';
import '../shop_details/shop_details_controller.dart';
import 'favorite_model.dart';

class favoriteController extends GetxController with StateMixin<favoriteModel> {

  favoriteModel? model;
  void onInit() async{
    super.onInit();

  }

  delete_favorite_postApi(String shop_id,String customers_id,var data){


    // Get.dialog(Center(child: Container(height: 100,width: 100,child: CircularProgressIndicator(),)));
    Get.dialog(Center(child: CircularProgressIndicator(),));

    ApiService().postDataForm(url:'?checkopration=delete_favorite&shop_id=${shop_id}'+'&customers_id=${customers_id}').then((value) {
      Get.back();
      GetSnackMsg(msg: 'تم حذفة من المفضلة'.tr,bgClr:Colors.green ,txClr:kColorsWhite ).showTxt();

      Get.put(favoriteController()).getFavoriteApi(customers_id);
      Get.put(shopDetailsController()).getGalleryApi(shop_id,customers_id);
      Get.to(() => shop_detailsScreen(data));
      if(value.statusCode==200) {
        // GetSnackMsg(msg: 'تم اضافة الى المفضلة'.tr,bgClr:Colors.green ,txClr:kColorsWhite ).showTxt();
        //
        // print(value.data);
        // //   print(value.data["success"]);
        // favoriteModel loginModel =  favoriteModel.fromJson(json.decode(value.data));
        // print(value.data);
        // print(loginModel.success);
        // if(loginModel.success==true){
        //
        //   Get.back();
        //   update();
        // }
        // else{
        //   print('errr');
        // }


      }
      else{


      }}

    );
  }


  add_favorite_postApi(String shop_id,String customers_id,var data){


    // Get.dialog(Center(child: Container(height: 100,width: 100,child: CircularProgressIndicator(),)));
    Get.dialog(Center(child: CircularProgressIndicator(),));

    ApiService().postDataForm(url:'?checkopration=add_favorite&shop_id=${shop_id}'+'&customers_id=${customers_id}').then((value) {
      Get.back();
      Get.put(favoriteController()).getFavoriteApi(customers_id);
      Get.put(shopDetailsController()).getGalleryApi(shop_id,customers_id);
      Get.to(() => shop_detailsScreen(data));
      GetSnackMsg(msg: 'تم اضافة الى المفضلة'.tr,bgClr:Colors.green ,txClr:kColorsWhite ).showTxt();

      if(value.statusCode==200) {
        // GetSnackMsg(msg: 'تم اضافة الى المفضلة'.tr,bgClr:Colors.green ,txClr:kColorsWhite ).showTxt();
        //
        // print(value.data);
        // //   print(value.data["success"]);
        // favoriteModel loginModel =  favoriteModel.fromJson(json.decode(value.data));
        // print(value.data);
        // print(loginModel.success);
        // if(loginModel.success==true){
        //
        //   Get.back();
        //   update();
        // }
        // else{
        //   print('errr');
        // }


      }
      else{


      }}

    );
  }

  getFavoriteApi(String customers_id){




    change(null, status: RxStatus.loading());
    ApiService().getData('?checkopration=load_Data_shop_favorite&customers_id=$customers_id').then((value) {

      if(value.statusCode==200) {
 print("aa");

print(value.data);

 favoriteModel data =  favoriteModel.fromJson(json.decode(value.data));


        print(value.data);



        update();
        change(data, status: RxStatus.success());


      }
      else{
        print("ee");
        change(null, status: RxStatus.error());

      }}

    );
  }
}*/


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apiservice/checkInterNet.dart';
import '../../screen/section/section_model.dart';
import '../../screen/shop/shop_model.dart';
import '../../Constants.dart';
import '../../apiservice/api_service.dart';
import '../../apiservice/url.dart';
import '../../router/route_constants.dart';
import '../../widget/dailog_widget.dart';
import '../../widget/my_data.dart';
import '../shop_details/shop_details.dart';
import '../shop_details/shop_details_controller.dart';
import 'favorite_model.dart';

class favoriteController extends GetxController with StateMixin<favoriteModel> {
  favoriteModel? model;

  @override
  void onInit() async {
    super.onInit();
  }

  delete_favorite_postApi(String shop_id, String customers_id, var data) {
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    ApiService().postDataForm(url: '?checkopration=delete_favorite&shop_id=${shop_id}&customers_id=${customers_id}').then((value) {
      Get.back();

      if (value.statusCode == 200) {
        try {
          // Parse response to check if operation was successful
          if (value.data != null && value.data.toString().isNotEmpty) {
            favoriteModel response = favoriteModel.fromJson(json.decode(value.data));
            if (response.success == true) {
              GetSnackMsg(
                  msg: 'تم حذفة من المفضلة'.tr,
                  bgClr: Colors.green,
                  txClr: kColorsWhite
              ).showTxt();

              // Refresh data
              Get.find<favoriteController>().getFavoriteApi(customers_id);
              Get.find<shopDetailsController>().getGalleryApi(shop_id, customers_id);
              Get.to(() => shop_detailsScreen(data));
            } else {
              GetSnackMsg(
                  msg: response.message ?? 'Failed to remove from favorites',
                  bgClr: kColorRed,
                  txClr: kColorsWhite
              ).showTxt();
            }
          }
        } catch (e) {
          print("JSON parsing error in delete_favorite: $e");
          GetSnackMsg(
              msg: 'تم حذفة من المفضلة'.tr,
              bgClr: Colors.green,
              txClr: kColorsWhite
          ).showTxt();

          // Refresh data even if parsing fails (assuming success)
          Get.find<favoriteController>().getFavoriteApi(customers_id);
          Get.find<shopDetailsController>().getGalleryApi(shop_id, customers_id);
          Get.to(() => shop_detailsScreen(data));
        }
      } else {
        GetSnackMsg(
            msg: 'Server error: ${value.statusCode}',
            bgClr: kColorRed,
            txClr: kColorsWhite
        ).showTxt();
      }
    }).catchError((error) {
      Get.back();
      print("Network error in delete_favorite: $error");
      GetSnackMsg(
          msg: 'Network error: Please check your connection',
          bgClr: kColorRed,
          txClr: kColorsWhite
      ).showTxt();
    });
  }

  add_favorite_postApi(String shop_id, String customers_id, var data) {
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    ApiService().postDataForm(url: '?checkopration=add_favorite&shop_id=${shop_id}&customers_id=${customers_id}').then((value) {
      Get.back();

      if (value.statusCode == 200) {
        try {
          // Parse response to check if operation was successful
          if (value.data != null && value.data.toString().isNotEmpty) {
            favoriteModel response = favoriteModel.fromJson(json.decode(value.data));
            if (response.success == true) {
              GetSnackMsg(
                  msg: 'تم اضافة الى المفضلة'.tr,
                  bgClr: Colors.green,
                  txClr: kColorsWhite
              ).showTxt();

              // Refresh data
              Get.find<favoriteController>().getFavoriteApi(customers_id);
              Get.find<shopDetailsController>().getGalleryApi(shop_id, customers_id);
              Get.to(() => shop_detailsScreen(data));
            } else {
              GetSnackMsg(
                  msg: response.message ?? 'Failed to add to favorites',
                  bgClr: kColorRed,
                  txClr: kColorsWhite
              ).showTxt();
            }
          }
        } catch (e) {
          print("JSON parsing error in add_favorite: $e");
          GetSnackMsg(
              msg: 'تم اضافة الى المفضلة'.tr,
              bgClr: Colors.green,
              txClr: kColorsWhite
          ).showTxt();

          // Refresh data even if parsing fails (assuming success)
          Get.find<favoriteController>().getFavoriteApi(customers_id);
          Get.find<shopDetailsController>().getGalleryApi(shop_id, customers_id);
          Get.to(() => shop_detailsScreen(data));
        }
      } else {
        GetSnackMsg(
            msg: 'Server error: ${value.statusCode}',
            bgClr: kColorRed,
            txClr: kColorsWhite
        ).showTxt();
      }
    }).catchError((error) {
      Get.back();
      print("Network error in add_favorite: $error");
      GetSnackMsg(
          msg: 'Network error: Please check your connection',
          bgClr: kColorRed,
          txClr: kColorsWhite
      ).showTxt();
    });
  }

  getFavoriteApi(String customers_id) {
    change(null, status: RxStatus.loading());

    ApiService().getData('?checkopration=load_Data_shop_favorite&customers_id=$customers_id').then((value) {
      if (value.statusCode == 200) {
        print("Favorite API Response: ${value.data}");

        // Check if response data is not empty
        if (value.data == null || value.data.toString().isEmpty) {
          change(null, status: RxStatus.empty());
          return;
        }

        try {
          favoriteModel data = favoriteModel.fromJson(json.decode(value.data));
          update();
          change(data, status: RxStatus.success());
        } catch (e) {
          print("JSON parsing error in getFavoriteApi: $e");
          change(null, status: RxStatus.error("Failed to parse favorite data"));
        }
      } else {
        print("API error with status code: ${value.statusCode}");
        change(null, status: RxStatus.error("API Error: ${value.statusCode}"));
      }
    }).catchError((error) {
      print("Network error in getFavoriteApi: $error");
      change(null, status: RxStatus.error("Network Error"));
    });
  }
}
