//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:path/path.dart';
//
// import '../../apiservice/checkInterNet.dart';
//
// import '../../Constants.dart';
// import '../../apiservice/api_service.dart';
// import '../../apiservice/url.dart';
// import '../../router/route_constants.dart';
// import '../../widget/dailog_widget.dart';
// import '../login/login.dart';
// import 'sign_up_model.dart';
// import 'package:loading_indicator/loading_indicator.dart';
// class signUpController extends GetxController with StateMixin<signUpModel> {
//
//
//   signUpModel?signModel ;
//   late TextEditingController name;
//   late TextEditingController pass;
//   late TextEditingController phone;
//   late TextEditingController email;
//
//   void onInit() async{
//     // TODO: implement onInit
//     super.onInit();
//
//     name=TextEditingController();
//     pass=TextEditingController();
//     phone=TextEditingController();
//     email=TextEditingController();
//
//   }
//
//
//   postApi(){
//
//    // Get.dialog(Center(child: Container(height: 100,width: 100,child: CircularProgressIndicator(),)));
//    //   Get.dialog(Center(child: CircularProgressIndicator(),));
//
//      Get.dialog(Center(
//        child: Container(
//          width: 80.w,
//          height: 80.w,
//          child: Center(child: LoadingIndicator(
//            indicatorType: Indicator.ballPulseSync, /// Required, The loading type of the widget
//            colors: const [kColorsPrimary],       /// Optional, The color collections
//            /// Optional, The stroke of the line, only applicable to widget which contains line
//            /// Optional, the stroke backgroundColor
//          ),),
//        ),
//      ));
//
//     // showDialog(context: ,builder: (_) => CustomEventDialog() );
//     ApiService().postDataForm(url:'?checkopration=Sign_Up&name=${name.text.trim()}'+'&pass=${pass.text.trim()}'+'&phone=${phone.text.trim()}'+'&email=${email.text.trim()}').then((value) {
//       print('errruu');
//      // Get.back();
//       //  loginErrorModel=LoginErrorModel.fromJson(value.data);
//    //   GetSnackMsg(msg: "hg",bgClr:kColorRed ,txClr:kColorsWhite ).showTxt();
//       print(value.data);
//       if(value.statusCode==200) {
//         print(value.data);
//      //   print(value.data["success"]);
//         signUpModel loginModel =  signUpModel.fromJson(json.decode(value.data));
//      //   print(value.data);
//         print(loginModel.success);
// if(loginModel.success==true){
//  // signUpModel loginModel =  signUpModel.fromJson(json.decode(value.data));
//   Get.back();
//   change(null,status: RxStatus.success());
//   Get.to(LoginScreen());
//   // Get.offAllNamed(RoutingApp.dashBoardScreenRoute,);
//   print("aaaaa");
//         print(value.data);
//
//
//
//         update();}else{
//   print('errrd');
// }
//
//
//       }
//       else{
//         print('ff');
//         Get.back();
//       //  loginErrorModel=LoginErrorModel.fromJson(value.data);
//       //   GetSnackMsg(msg: "hg",bgClr:kColorRed ,txClr:kColorsWhite ).showTxt();
//         print(value.data);
//       }}
//
//     );
//   }
// }


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../apiservice/checkInterNet.dart';
import '../../Constants.dart';
import '../../apiservice/api_service.dart';
import '../../apiservice/url.dart';
import '../../router/route_constants.dart';
import '../../widget/dailog_widget.dart';
import '../login/login.dart';
import 'sign_up_model.dart';

class signUpController extends GetxController with StateMixin<signUpModel> {
  signUpModel? signModel;
  late TextEditingController name;
  late TextEditingController pass;
  late TextEditingController phone;
  late TextEditingController email;

  @override
  void onInit() async {
    super.onInit();
    name = TextEditingController();
    pass = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
  }

  // Input validation method
  bool validateInputs() {
    if (name.text.isEmpty) {
      GetSnackMsg(
          msg: "Please enter your name".tr,
          bgClr: kColorRed,
          txClr: kColorsWhite
      ).showTxt();
      return false;
    }

    if (pass.text.isEmpty) {
      GetSnackMsg(
          msg: "Please enter password".tr,
          bgClr: kColorRed,
          txClr: kColorsWhite
      ).showTxt();
      return false;
    }

    if (phone.text.isEmpty) {
      GetSnackMsg(
          msg: "Please enter phone number".tr,
          bgClr: kColorRed,
          txClr: kColorsWhite
      ).showTxt();
      return false;
    }

    if (email.text.isEmpty) {
      GetSnackMsg(
          msg: "Please enter email".tr,
          bgClr: kColorRed,
          txClr: kColorsWhite
      ).showTxt();
      return false;
    }

    // Basic email validation
    if (!GetUtils.isEmail(email.text.trim())) {
      GetSnackMsg(
          msg: "Please enter a valid email".tr,
          bgClr: kColorRed,
          txClr: kColorsWhite
      ).showTxt();
      return false;
    }

    return true;
  }

  postApi() {
    // Validate inputs before making API call
    if (!validateInputs()) {
      return;
    }

    // Show loading dialog
    Get.dialog(
      Center(
        child: Container(
          width: 80.w,
          height: 80.w,
          child: Center(
            child: LoadingIndicator(
              indicatorType: Indicator.ballPulseSync,
              colors: const [kColorsPrimary],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );

    // Build URL with proper encoding
    final url = '?checkopration=Sign_Up'
        '&name=${Uri.encodeQueryComponent(name.text.trim())}'
        '&pass=${Uri.encodeQueryComponent(pass.text.trim())}'
        '&phone=${Uri.encodeQueryComponent(phone.text.trim())}'
        '&email=${Uri.encodeQueryComponent(email.text.trim())}';

    print("Signup URL: $url");

    ApiService().postDataForm(url: url).then((value) {
      Get.back(); // Close loading dialog

      if (value.statusCode == 200) {
        print("Signup response: ${value.data}");

        // Check if response data is not empty
        if (value.data == null || value.data.toString().isEmpty) {
          GetSnackMsg(
              msg: "Empty response from server".tr,
              bgClr: kColorRed,
              txClr: kColorsWhite
          ).showTxt();
          return;
        }

        try {
          signUpModel signupModel = signUpModel.fromJson(json.decode(value.data));
          print("Signup success: ${signupModel.success}");

          if (signupModel.success == true) {
            // Success case
            change(null, status: RxStatus.success());

            // Show success message
            GetSnackMsg(
                msg: signupModel.message ?? "Registration successful".tr,
                bgClr: Colors.green,
                txClr: kColorsWhite
            ).showTxt();

            // Navigate to login screen
            Get.to(() => LoginScreen());

            // Clear controllers
            clearForm();
          } else {
            // Error case from API
            GetSnackMsg(
                msg: signupModel.message ?? "Registration failed".tr,
                bgClr: kColorRed,
                txClr: kColorsWhite
            ).showTxt();
            print('Signup failed: ${signupModel.message}');
          }
        } catch (e) {
          print("JSON parsing error: $e");
          GetSnackMsg(
              msg: "Failed to process registration response".tr,
              bgClr: kColorRed,
              txClr: kColorsWhite
          ).showTxt();
        }
      } else {
        // HTTP error
        print("API error with status code: ${value.statusCode}");
        GetSnackMsg(
            msg: "Server error: ${value.statusCode}".tr,
            bgClr: kColorRed,
            txClr: kColorsWhite
        ).showTxt();
      }
    }).catchError((error) {
      Get.back(); // Close loading dialog on error
      print("Network error: $error");
      GetSnackMsg(
          msg: "Network error: Please check your connection".tr,
          bgClr: kColorRed,
          txClr: kColorsWhite
      ).showTxt();
    });
  }

  // Method to clear form fields
  void clearForm() {
    name.clear();
    pass.clear();
    phone.clear();
    email.clear();
  }

  @override
  void onClose() {
    name.dispose();
    pass.dispose();
    phone.dispose();
    email.dispose();
    super.onClose();
  }
}