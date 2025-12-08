import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../apiservice/url.dart';
import '../../widget/customButton.dart';
import '../../widget/my_data.dart';
import '../login/login_model.dart';
import '../shop_details/shop_details.dart';
import '../shop_details/shop_details_controller.dart';

class Item extends StatelessWidget {
  final dynamic data;

  Item(this.data);

  void select(BuildContext ctx) {
    if (MyData.auth_user) {
      final loginModel = LoginModel.fromJson(GetStorage().read('store'));
      Get.put(ShopDetailsController())
          .getGalleryApi(data.id.toString(), loginModel.id.toString());
      Get.to(() => shop_detailsScreen(data));
    } else {
      Get.put(ShopDetailsController()).getGalleryApi(data.id.toString(), "0");
      Get.to(() => shop_detailsScreen(data));
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => select(context),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Card(
            color: Colors.white,
            margin: const EdgeInsets.fromLTRB(27, 0, 27, 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius:
                  const BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                  child: Image.network(
                    Url_shop + data.image.toString(),
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 15),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.nameShop.toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              const Icon(Icons.call, size: 12),
                              const SizedBox(width: 5),
                              Text(data.phone ?? '',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[500])),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.alternate_email, size: 12),
                              const SizedBox(width: 5),
                              Text(data.email ?? '',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[500])),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          const SizedBox(height: 7),
                          Row(
                            children: [
                              CustomButton(
                                color: const Color(0xFFF3F5FE),
                                sizeHeight: 15,
                                sizeWidth: 30,
                                row: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.remove_red_eye_outlined, size: 12),
                                    const SizedBox(width: 5),
                                    Text(data.viewer ?? '',
                                        style: const TextStyle(fontSize: 9.5)),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5),
                              CustomButton(
                                color: const Color(0xFFF3F5FE),
                                sizeHeight: 15,
                                sizeWidth: 130,
                                row: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.location_pin, size: 12),
                                    const SizedBox(width: 10),
                                    Text(
                                      "${data.cityName} - ${data.adress}",
                                      style: const TextStyle(fontSize: 9.5),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
