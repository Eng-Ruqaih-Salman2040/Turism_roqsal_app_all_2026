/*

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apiservice/checkInterNet.dart';
import '../../screen/section/section_model.dart';

import '../../apiservice/api_service.dart';
import '../../apiservice/url.dart';
import 'allShop_model.dart';

class allShopController extends GetxController with StateMixin<allShopModel> {

  allShopModel? model;
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getAll_sectionApi();



  }

  @override
  void onReady() {

    super.onReady();
    ever( Get.find<CheckInterNet>().connectionInterNet, (_)async {
      if(Get.find<CheckInterNet>().connectionInterNet.value!=0) {
        await getAll_sectionApi();
      }
    });
  }

  getAll_sectionApi(){



    change(null, status: RxStatus.loading());
    ApiService().getData('?checkopration=load_Data_All_section').then((value) {


      if(value.statusCode==200) {
 print("aa");

print(value.data);

 allShopModel data =  allShopModel.fromJson(json.decode(value.data));


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
import '../../apiservice/api_service.dart';
import '../../apiservice/url.dart';
import 'allShop_model.dart';

class allShopController extends GetxController with StateMixin<allShopModel> {
  allShopModel? model;

  @override
  void onInit() async {
    super.onInit();
    await getAll_sectionApi();
  }

  @override
  void onReady() {
    super.onReady();
    ever(Get.find<CheckInterNet>().connectionInterNet, (_) async {
      if (Get.find<CheckInterNet>().connectionInterNet.value != 0) {
        await getAll_sectionApi();
      }
    });
  }

  getAll_sectionApi() {
    change(null, status: RxStatus.loading());
    ApiService().getData('?checkopration=load_Data_All_section').then((value) {
      if (value.statusCode == 200) {
        print("Response data: ${value.data}");

        // Check if response data is not empty
        if (value.data == null || value.data.toString().isEmpty) {
          change(null, status: RxStatus.empty());
          return;
        }

        try {
          allShopModel data = allShopModel.fromJson(json.decode(value.data));
          update();
          change(data, status: RxStatus.success());
        } catch (e) {
          print("JSON parsing error: $e");
          change(null, status: RxStatus.error("Failed to parse data"));
        }
      } else {
        print("API error with status code: ${value.statusCode}");
        change(null, status: RxStatus.error("API Error: ${value.statusCode}"));
      }
    }).catchError((error) {
      print("Network error: $error");
      change(null, status: RxStatus.error("Network Error"));
    });
  }
}