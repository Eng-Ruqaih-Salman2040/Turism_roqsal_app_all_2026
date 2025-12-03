/*
class favoriteModel {
  List<Shop>? shop;
  bool? success;
  String? message;

  favoriteModel({this.shop, this.success, this.message});

  favoriteModel.fromJson(Map<String, dynamic> json) {
    if (json['shop'] != null) {
      shop = <Shop>[];
      json['shop'].forEach((v) {
        shop!.add(new Shop.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shop != null) {
      data['shop'] = this.shop!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
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
  // String? price;
  String? viewer;

  Shop(
      {this.id,
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
        // this.price,
        this.viewer});

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    passowrd = json['passowrd'];
    nameShop = json['name_shop'];
    cityName = json['city_name'];
    sectionName = json['section_name'];
    adress = json['adress'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    description = json['description'];
    // price = json['price'];
    viewer = json['viewer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['passowrd'] = this.passowrd;
    data['name_shop'] = this.nameShop;
    data['city_name'] = this.cityName;
    data['section_name'] = this.sectionName;
    data['adress'] = this.adress;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['description'] = this.description;
    // data['price'] = this.price;
    data['viewer'] = this.viewer;
    return data;
  }
}
*/

class favoriteModel {
  List<Shop>? shop;
  bool? success;
  String? message;

  favoriteModel({this.shop, this.success, this.message});

  favoriteModel.fromJson(Map<String, dynamic> json) {
    if (json['shop'] != null) {
      shop = <Shop>[];
      json['shop'].forEach((v) {
        shop!.add(Shop.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    // Handle both String and int types for id
    id = json['id']?.toString();
    userName = json['user_name'];
    passowrd = json['passowrd'];
    nameShop = json['name_shop'];
    cityName = json['city_name'];
    sectionName = json['section_name'];
    adress = json['adress'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    description = json['description'];
    // Handle both String and int types for viewer
    viewer = json['viewer']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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