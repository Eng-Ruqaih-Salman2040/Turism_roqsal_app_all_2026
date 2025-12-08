import 'package:get/get.dart';
//import '../Rating/Rating_control.dart';
import '../apiservice/checkInterNet.dart';
import '../screen/Rating/Rating_control.dart';
import '../screen/notifications/notifications_contraller.dart';
import '../screen/section/section_controller.dart';
import '../screen/shop/shop_controller.dart';
import '../screen/sliderAds/ads_controller.dart';

// إضافة: استيراد خدمة الـ API وكنترولر التقييم
import '../apiservice/api_service.dart';
//import '../screen/rating/rating_controller.dart';

class CheckInternetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckInterNet>(
          () => CheckInterNet(),
    );
  }
}

class MagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<shopController>(
          () => shopController(),
    );
  }
}

class sectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<sectionController>(
          () => sectionController(),
    );
  }
}

class agsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<adsController>(
          () => adsController(),
    );
  }
}

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsController>(
          () => NotificationsController(),
    );
  }
}

// إضافة: Binding خاص بصفحة التقييم
class RatingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiService(), fenix: true);
    Get.lazyPut<RatingController>(() => RatingController(Get.find<ApiService>()));
  }
}