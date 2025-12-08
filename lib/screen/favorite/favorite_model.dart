class FavoriteModel {
  List<Shop>? shop;
  bool? success;
  String? message;

  FavoriteModel({this.shop, this.success, this.message});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    // نحاول نقرأ أي مفتاح يحتوي على القائمة
    var shopList = json['shop'] ?? json['data'] ?? json['favorites'] ?? json['shops'];

    if (shopList != null && shopList is List) {
      shop = <Shop>[];
      for (var v in shopList) {
        shop!.add(Shop.fromJson(v));
      }
    } else {
      shop = [];
    }

    // نحاول نقرأ success سواء كانت bool أو int أو string
    if (json['success'] is bool) {
      success = json['success'];
    } else if (json['success'] is int) {
      success = json['success'] == 1;
    } else if (json['success'] is String) {
      success = json['success'].toString().toLowerCase() == 'true' ||
          json['success'].toString() == '1';
    } else {
      success = false;
    }

    message = json['message']?.toString() ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (shop != null) {
      data['shop'] = shop!.map((v) => v.toJson()).toList();
    }
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}

class Shop {
  String? id;
  String? userName;
  String? passowrd;
  String? nameShop;
  String? cityName;
  String? sectionName;
  String? adress;
  String? email;
  String? phone;
  String? image;
  String? description;
  String? viewer;

  var shopId;

  Shop({
    this.id,
    this.userName,
    this.passowrd,
    this.nameShop,
    this.cityName,
    this.sectionName,
    this.adress,
    this.email,
    this.phone,
    this.image,
    this.description,
    this.viewer,
  });

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    userName = json['user_name']?.toString();
    passowrd = json['passowrd']?.toString();
    nameShop = json['name_shop']?.toString();
    cityName = json['city_name']?.toString();
    sectionName = json['section_name']?.toString();
    adress = json['adress']?.toString();
    email = json['email']?.toString();
    phone = json['phone']?.toString();
    image = json['image']?.toString();
    description = json['description']?.toString();
    viewer = json['viewer']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['user_name'] = userName;
    data['passowrd'] = passowrd;
    data['name_shop'] = nameShop;
    data['city_name'] = cityName;
    data['section_name'] = sectionName;
    data['adress'] = adress;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    data['description'] = description;
    data['viewer'] = viewer;
    return data;
  }
}
