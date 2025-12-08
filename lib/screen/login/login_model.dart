/*
class LoginModel {
  String? id;
  String? name;
  String? imge;
  String? phone;
  String? date_register;
  String? email;

  bool? success;
  String? message;



  LoginModel(
      {this.id,
        this.name,
        this.imge,
        this.phone,
        this.date_register,
        this.email,
        this.success,
        this.message,});

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imge = json['imge'];
    phone = json['phone'];
    date_register = json['date_register'];
    email = json['email'];
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['imge'] = this.imge;
    data['phone'] = this.phone;
    data['date_register'] = this.date_register;
    data['email'] = this.email;
    data['success'] = this.success;
    data['message'] = this.message;

    return data;
  }
}
*/


class LoginModel {
  String? id;
  String? name;
  String? imge;
  String? phone;
  String? date_register;
  String? email;
  bool? success;
  String? message;

  LoginModel({
    this.id,
    this.name,
    this.imge,
    this.phone,
    this.date_register,
    this.email,
    this.success,
    this.message,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    // Handle both String and int types for id
    id = json['id']?.toString();
    name = json['name'];
    imge = json['imge'];
    // Handle both String and int types for phone
    phone = json['phone']?.toString();
    date_register = json['date_register'];
    email = json['email'];
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['imge'] = imge;
    data['phone'] = phone;
    data['date_register'] = date_register;
    data['email'] = email;
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}