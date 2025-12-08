import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../screen/section/section_model.dart';
import '../../apiservice/url.dart';
import '../../widget/customButton.dart';
import '../../widget/my_data.dart';
import '../../widget/my_text.dart';
import '../login/login_model.dart';
import '../shop_details/shop_details.dart';
import '../shop_details/shop_details_controller.dart';

class Item3 extends StatelessWidget {
  var data;

  Item3(this.data);

  void select(BuildContext ctx) {
    if (MyData.auth_user) {
      late LoginModel loginModle = LoginModel.fromJson(GetStorage().read('store'));

      Get.put(ShopDetailsController())
          .getGalleryApi(data.id.toString(), loginModle.id.toString());
      Get.to(() => shop_detailsScreen(this.data));
    } else {
      Get.put(ShopDetailsController()).getGalleryApi(data.id.toString(), "0");
      Get.to(() => shop_detailsScreen(this.data));
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => select(context),
      splashColor: Theme.of(context).primaryColor.withOpacity(0.2),
      borderRadius: BorderRadius.circular(15),
      child: Column(
        children: [
          SizedBox(height: 10),
          Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 🖼️ الصورة على اليسار
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "${Url_shop}${data.image}",
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.broken_image, size: 50, color: Colors.grey),
                    ),
                  ),

                  SizedBox(width: 12),

                  // 📋 النصوص على اليمين
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🏪 اسم المتجر
                        Text(
                          data.nameShop.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),

                        // ☎️ رقم الهاتف
                        Row(
                          children: [
                            Icon(Icons.call, size: 14, color: Colors.grey[600]),
                            SizedBox(width: 5),
                            Text(
                              data.phone,
                              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        SizedBox(height: 2),

                        // 📧 البريد الإلكتروني
                        Row(
                          children: [
                            Icon(Icons.alternate_email_outlined,
                                size: 14, color: Colors.grey[600]),
                            SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                data.email,
                                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),

                        // 📍 الموقع
                        Row(
                          children: [
                            Icon(Icons.location_pin, size: 14, color: Colors.redAccent),
                            SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                "${data.cityName} - ${data.adress}",
                                style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
