/*

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apiservice/checkInterNet.dart';
import '../../screen/section/section_model.dart';
import '../../screen/shop/shop_model.dart';

import '../../apiservice/api_service.dart';
import '../../apiservice/url.dart';

class shopController extends GetxController with StateMixin<shopModel> {

  shopModel? model;
  void onInit() async{
    // TODO: implement onInit
    super.onInit();



  }



  getShopApi(String id){





    change(null, status: RxStatus.loading());
    ApiService().getData('?checkopration=load_Data_shop&section_id=$id').then((value) {


      if(value.statusCode==200) {
 print("aa");

print(value.data);

 shopModel data =  shopModel.fromJson(json.decode(value.data));


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
import '../../apiservice/api_service.dart';
import '../../apiservice/url.dart';

class shopController extends GetxController with StateMixin<shopModel> {
  shopModel? model;

  @override
  void onInit() async {
    super.onInit();
  }

  getShopApi(String id) {
    change(null, status: RxStatus.loading());

    ApiService().getData('?checkopration=load_Data_shop&section_id=$id').then((value) {
      if (value.statusCode == 200) {
        print("Shop API Response: ${value.data}");

        // Check if response data is not empty
        if (value.data == null || value.data.toString().isEmpty) {
          change(null, status: RxStatus.empty());
          return;
        }

        try {
          shopModel data = shopModel.fromJson(json.decode(value.data));
          update();
          change(data, status: RxStatus.success());
        } catch (e) {
          print("JSON parsing error in getShopApi: $e");
          change(null, status: RxStatus.error("Failed to parse shop data"));
        }
      } else {
        print("API error with status code: ${value.statusCode}");
        change(null, status: RxStatus.error("API Error: ${value.statusCode}"));
      }
    }).catchError((error) {
      print("Network error in getShopApi: $error");
      change(null, status: RxStatus.error("Network Error"));
    });
  }
}