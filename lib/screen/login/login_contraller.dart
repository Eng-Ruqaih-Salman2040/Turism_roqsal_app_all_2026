/*

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../apiservice/checkInterNet.dart';
import '../../Constants.dart';
import '../../apiservice/api_service.dart';
import '../../apiservice/url.dart';
import '../../router/route_constants.dart';
import '../../widget/dailog_widget.dart';
import '../../widget/my_data.dart';
import 'login_model.dart';

class LoginController extends GetxController with StateMixin<LoginModel> {


  LoginModel?levelsModel ;
  late TextEditingController name;
  late TextEditingController password;
  void onInit() async{
    // TODO: implement onInit
    super.onInit();

name=TextEditingController();
password=TextEditingController();

  }


  loginApi(){


Get.dialog(Center(child: Container(height: 100,width: 100,child: CircularProgressIndicator(),)),);

    ApiService().postDataLogin(url:'?checkopration=Login&name=${name.text.trim()}'+'&password=${password.text.trim()}').then((value) {
      Get.back();
      if(value.statusCode==200) {
    //    print(value.data);
     //   print(value.data["success"]);
        LoginModel loginModel =  LoginModel.fromJson(json.decode(value.data));
        print(value.data);
        print(loginModel.success);
if(loginModel.success==true){
       GetStorage().write('store', loginModel.toJson());
       MyData.auth_user=true;

        Get.toNamed(RoutingApp.dashBoardScreenRoute,);

        print(value.data);



        update();}else{
  LoginModel loginModel =  LoginModel.fromJson(json.decode(value.data));
  print(value.data);
  print(loginModel.success);
  GetSnackMsg(msg:loginModel.message.toString() ,bgClr:kColorRed ,txClr:kColorsWhite ).showTxt();

  print('errr');
}


      }
      else{


      }}

    );
  }
}*/


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../apiservice/checkInterNet.dart';
import '../../Constants.dart';
import '../../apiservice/api_service.dart';
import '../../apiservice/url.dart';
import '../../router/route_constants.dart';
import '../../widget/dailog_widget.dart';
import '../../widget/my_data.dart';
import 'login_model.dart';

class LoginController extends GetxController with StateMixin<LoginModel> {
  LoginModel? levelsModel;
  late TextEditingController name;
  late TextEditingController password;

  @override
  void onInit() async {
    super.onInit();
    name = TextEditingController();
    password = TextEditingController();
  }

  loginApi() {
    // Show loading dialog
    Get.dialog(
      Center(
        child: Container(
          height: 100,
          width: 100,
          child: CircularProgressIndicator(),
        ),
      ),
      barrierDismissible: false,
    );

    // Build URL with proper encoding
    final url = '?checkopration=Login&name=${Uri.encodeQueryComponent(name.text.trim())}&password=${Uri.encodeQueryComponent(password.text.trim())}';

    ApiService().postDataLogin(url: url).then((value) {
      Get.back(); // Close loading dialog

      if (value.statusCode == 200) {
        print("Login response: ${value.data}");

        // Check if response data is not empty
        if (value.data == null || value.data.toString().isEmpty) {
          GetSnackMsg(msg: "Empty response from server", bgClr: kColorRed, txClr: kColorsWhite).showTxt();
          return;
        }

        try {
          LoginModel loginModel = LoginModel.fromJson(json.decode(value.data));
          print("Login success: ${loginModel.success}");

          if (loginModel.success == true) {
            // Store user data
            GetStorage().write('store', loginModel.toJson());
            MyData.auth_user = true;

            // Clear password field for security
            password.clear();

            Get.toNamed(RoutingApp.dashBoardScreenRoute);
          } else {
            GetSnackMsg(
                msg: loginModel.message ?? "Login failed",
                bgClr: kColorRed,
                txClr: kColorsWhite
            ).showTxt();
            print('Login failed: ${loginModel.message}');
          }
        } catch (e) {
          print("JSON parsing error: $e");
          GetSnackMsg(
              msg: "Failed to process login response",
              bgClr: kColorRed,
              txClr: kColorsWhite
          ).showTxt();
        }
      } else {
        print("API error with status code: ${value.statusCode}");
        GetSnackMsg(
            msg: "Server error: ${value.statusCode}",
            bgClr: kColorRed,
            txClr: kColorsWhite
        ).showTxt();
      }
    }).catchError((error) {
      Get.back(); // Close loading dialog on error
      print("Network error: $error");
      GetSnackMsg(
          msg: "Network error: Please check your connection",
          bgClr: kColorRed,
          txClr: kColorsWhite
      ).showTxt();
    });
  }

  @override
  void onClose() {
    name.dispose();
    password.dispose();
    super.onClose();
  }
}