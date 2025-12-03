/*
class adsModel {
  List<Ads>? ads;
  bool? success;
  String? message;

  adsModel({this.ads, this.success, this.message});

  adsModel.fromJson(Map<String, dynamic> json) {
    if (json['ads'] != null) {
      ads = <Ads>[];
      json['ads'].forEach((v) {
        ads!.add(new Ads.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ads != null) {
      data['ads'] = this.ads!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}

class Ads {
  String? id;
  String? imge;
  String? note;
  String? dateCreate;
  String? timeCreate;

  Ads({this.id, this.imge, this.note, this.dateCreate, this.timeCreate});

  Ads.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imge = json['imge'];
    note = json['note'];
    dateCreate = json['date_create'];
    timeCreate = json['time_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imge'] = this.imge;
    data['note'] = this.note;
    data['date_create'] = this.dateCreate;
    data['time_create'] = this.timeCreate;
    return data;
  }
}
*/

class adsModel {
  List<Ads>? ads;
  bool? success;
  String? message;

  adsModel({this.ads, this.success, this.message});

  adsModel.fromJson(Map<String, dynamic> json) {
    if (json['ads'] != null) {
      ads = <Ads>[];
      json['ads'].forEach((v) {
        ads!.add(Ads.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (ads != null) {
      data['ads'] = ads!.map((v) => v.toJson()).toList();
    }
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}

class Ads {
  String? id;
  String? imge;
  String? note;
  String? dateCreate;
  String? timeCreate;

  Ads({this.id, this.imge, this.note, this.dateCreate, this.timeCreate});

  Ads.fromJson(Map<String, dynamic> json) {
    // Handle both String and int types for id
    id = json['id']?.toString();
    imge = json['imge'];
    note = json['note'];
    dateCreate = json['date_create'];
    timeCreate = json['time_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['imge'] = imge;
    data['note'] = note;
    data['date_create'] = dateCreate;
    data['time_create'] = timeCreate;
    return data;
  }
}