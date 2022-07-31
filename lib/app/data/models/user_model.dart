// // To parse this JSON data, do
// //
// //     final userModel = userModelFromJson(jsonString);

// import 'dart:convert';

// UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

// String userModelToJson(UserModel data) => json.encode(data.toJson());

// class UserModel {
//   UserModel({
//     this.page,
//     this.perPage,
//     this.total,
//     this.totalPages,
//     this.data,
//     this.support,
//   });

//   int? page;
//   int? perPage;
//   int? total;
//   int? totalPages;
//   List<Datum>? data;
//   Support? support;

//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         page: json["page"],
//         perPage: json["per_page"],
//         total: json["total"],
//         totalPages: json["total_pages"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//         support: Support.fromJson(json["support"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "page": page,
//         "per_page": perPage,
//         "total": total,
//         "total_pages": totalPages,
//         "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//         "support": support!.toJson(),
//       };
// }

// class Datum {
//   Datum({
//     this.id,
//     this.name,
//     this.year,
//     this.color,
//     this.pantoneValue,
//   });

//   int? id;
//   String? name;
//   int? year;
//   String? color;
//   String? pantoneValue;

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         name: json["name"],
//         year: json["year"],
//         color: json["color"],
//         pantoneValue: json["pantone_value"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "year": year,
//         "color": color,
//         "pantone_value": pantoneValue,
//       };
// }

// class Support {
//   Support({
//     this.url,
//     this.text,
//   });

//   String? url;
//   String? text;

//   factory Support.fromJson(Map<String, dynamic> json) => Support(
//         url: json["url"],
//         text: json["text"],
//       );

//   Map<String, dynamic> toJson() => {
//         "url": url,
//         "text": text,
//       };
// }

// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.data,
    this.support,
  });

  Data? data;
  Support? support;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: Data.fromJson(json["data"]),
        support: Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "support": support!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}

class Support {
  Support({
    this.url,
    this.text,
  });

  String? url;
  String? text;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}
