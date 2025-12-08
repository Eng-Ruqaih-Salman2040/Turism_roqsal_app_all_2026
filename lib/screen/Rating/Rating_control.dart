import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../apiservice/api_service.dart';
import '../../apiservice/url.dart';
//import '../../models/rating_model.dart';
//import '../login/login_model.dart';
import '../login/login_model.dart';
import '../screen/login/login_model.dart';
import 'Rating_model.dart';

class RatingController extends GetxController {
  final ApiService api;
  RatingController(this.api);

  late final int shopId;
  String? shopName;

  final ratings = <RatingModel>[].obs;
  final avg = 0.0.obs;
  final total = 0.obs;

  final selected = 5.obs;
  final sending = false.obs;
  final loading = false.obs;
  final commentCtl = TextEditingController();

  int? userId;

  @override
  void onInit() {
    final args = Get.arguments ?? {};
    final dynamic sid = args['shopId'];
    // آمن: يدعم int أو String
    shopId = (sid is int) ? sid : int.tryParse(sid?.toString() ?? '') ?? 0;
    shopName = args['shopName']?.toString();
    super.onInit();
    initData();
  }

  Map<String, dynamic> _asMap(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is String) {
      try {
        return jsonDecode(data) as Map<String, dynamic>;
      } catch (_) {
        return {}; // لا ترمِ استثناء حتى لو رجع HTML/نص
      }
    }
    return {};
  }

  Future<void> initData() async {
    loading.value = true;
    try {
      if (shopId == 0) {
        Get.snackbar('تنبيه', 'معرّف المتجر غير صالح');
        ratings.value = [];
        avg.value = 0;
        total.value = 0;
        return;
      }
      await loadSummary();
      await loadList();
    } catch (e) {
      Get.snackbar('خطأ', 'تعذر تحميل التقييمات');
    } finally {
      loading.value = false; // مهم: يوقف اللودر مهما حدث
    }
  }

  Future<void> loadSummary() async {
    final path = urlGetRatingSummaryPath(shopId);
    final res = await api.getData(path);
    // طباعة للتشخيص
    try {
      // قد يكون res null في بعض الأخطاء
      final data = _asMap(res?.data);
      avg.value = double.tryParse(data['avg_rating']?.toString() ?? '0') ?? 0.0;
      total.value = int.tryParse(data['total']?.toString() ?? '0') ?? 0;
    } catch (e) {
      avg.value = 0.0;
      total.value = 0;
    }
  }

  Future<void> loadList() async {
    final path = urlGetRatingsPath(shopId, limit: 50, offset: 0);
    final res = await api.getData(path);
    try {
      final data = _asMap(res?.data);
      final List list = data['ratings'] ?? [];
      ratings.value = list
          .map((e) => RatingModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    } catch (e) {
      ratings.value = [];
    }
  }

  Future<void> send() async {
    sending.value = true;
    try {
      // اجلب userId المخزن
      final box = GetStorage();
      if (box.hasData('store')) {
        final login = LoginModel.fromJson(box.read('store'));
        userId = int.tryParse(login.id.toString());
      }
      userId ??=
          int.tryParse((box.read('user_id') ?? box.read('customers_id') ?? box.read('id') ?? '0').toString()) ?? 0;

      final res = await api.postData(
        url: urlAddRatingPath,
        header: {},
        body: {
          'shop_id': '$shopId',
          'user_id': '$userId',
          'rating': '${selected.value}',
          'comment': commentCtl.text,
        },
      );

      final data = _asMap(res?.data);
      if (data['success'] == true) {
        commentCtl.clear();
        await initData();
        Get.snackbar('تم', 'تم حفظ التقييم');
      } else {
        Get.snackbar('خطأ', data['message']?.toString() ?? 'تعذر الحفظ');
      }
    } catch (e) {
      Get.snackbar('خطأ', 'تعذر إرسال التقييم');
    } finally {
      sending.value = false;
    }
  }

  @override
  void onClose() {
    commentCtl.dispose();
    super.onClose();
  }
}