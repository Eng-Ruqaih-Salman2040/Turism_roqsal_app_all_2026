//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../apiservice/checkInterNet.dart';
// import '../../screen/section/section_model.dart';
// import '../../screen/shop/shop_model.dart';
// import '../../screen/shop_details/shop_details_model.dart';
//
// import '../../apiservice/api_service.dart';
// import '../../apiservice/url.dart';
//
// class shopDetailsController extends GetxController with StateMixin<shopDetailsModel> {
//
//   shopDetailsModel? model;
//   void onInit() async{
//     // TODO: implement onInit
//     super.onInit();
//
//
//
//   }
//
//
//
//   getGalleryApi(String id,String customers_id){
//
//     change(null, status: RxStatus.loading());
//     ApiService().getData('?checkopration=gallery&shop_id=${id}'+'&customers_id=${customers_id}').then((value) {
//
//
//       if(value.statusCode==200) {
//  print("aa");
//
// print(value.data);
//
//  shopDetailsModel data =  shopDetailsModel.fromJson(json.decode(value.data));
//
//
//         print(value.data);
//
//
//
//         update();
//         change(data, status: RxStatus.success());
//
//
//       }
//       else{
//         print("ee");
//         change(null, status: RxStatus.error());
//
//       }}
//
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../apiservice/checkInterNet.dart';
import '../../screen/section/section_model.dart';
import '../../screen/shop/shop_model.dart';
import '../../screen/shop_details/shop_details_model.dart';
import '../../apiservice/api_service.dart';
import '../../apiservice/url.dart';

class ShopDetailsController extends GetxController with StateMixin<shopDetailsModel> {
  shopDetailsModel? model;

  @override
  void onInit() async {
    super.onInit();
  }

  void getGalleryApi(String id, String customersId) {
    change(null, status: RxStatus.loading());

    ApiService()
        .getData('?checkopration=gallery&shop_id=$id&customers_id=$customersId')
        .then((value) {
      if (value.statusCode == 200) {
        try {
          final data = shopDetailsModel.fromJson(json.decode(value.data));
          change(data, status: RxStatus.success());
          update();
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
