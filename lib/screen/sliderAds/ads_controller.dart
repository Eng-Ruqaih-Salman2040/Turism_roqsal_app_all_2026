/*

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apiservice/checkInterNet.dart';
import '../../screen/section/section_model.dart';

import '../../apiservice/api_service.dart';
import '../../apiservice/url.dart';
import 'ads_model.dart';

class adsController extends GetxController with StateMixin<adsModel> {

  adsModel? model;
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getAdsApi();



  }

  @override
  void onReady() {

    super.onReady();
    ever( Get.find<CheckInterNet>().connectionInterNet, (_)async {
      if(Get.find<CheckInterNet>().connectionInterNet.value!=0) {
        await getAdsApi();
      }
    });
  }

  getAdsApi({String? parmater}){



    change(null, status: RxStatus.loading());
    ApiService().getData('?checkopration=load_Data_Ads').then((value) {


      if(value.statusCode==200) {
 print("aa");

print(value.data);

        adsModel data =  adsModel.fromJson(json.decode(value.data));


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
import 'ads_model.dart';

class adsController extends GetxController with StateMixin<adsModel> {
  adsModel? model;

  @override
  void onInit() async {
    super.onInit();
    await getAdsApi();
  }

  @override
  void onReady() {
    super.onReady();
    ever(Get.find<CheckInterNet>().connectionInterNet, (_) async {
      if (Get.find<CheckInterNet>().connectionInterNet.value != 0) {
        await getAdsApi();
      }
    });
  }

  getAdsApi({String? parmater}) {
    change(null, status: RxStatus.loading());

    ApiService().getData('?checkopration=load_Data_Ads').then((value) {
      if (value.statusCode == 200) {
        print("aa");
        print(value.data);

        // Check if response data is not empty
        if (value.data == null || value.data.toString().isEmpty) {
          change(null, status: RxStatus.empty());
          return;
        }

        try {
          adsModel data = adsModel.fromJson(json.decode(value.data));
          update();
          change(data, status: RxStatus.success());
        } catch (e) {
          print("JSON parsing error: $e");
          change(null, status: RxStatus.error("Failed to parse ads data"));
        }
      } else {
        print("ee - Status code: ${value.statusCode}");
        change(null, status: RxStatus.error("Ads API Error: ${value.statusCode}"));
      }
    }).catchError((error) {
      print("Network error in ads: $error");
      change(null, status: RxStatus.error("Network Error"));
    });
  }
}