
//
//     final vehicleTableModel = vehicleTableModelFromJson(jsonString);

import 'dart:convert';

class ShoppingModel {
ShoppingModel({
this.data,
});

List<ShoppingItemModel>? data;

factory ShoppingModel.fromRawJson(String str) => ShoppingModel.fromJson(json.decode(str));

String toRawJson() => json.encode(toJson());

factory ShoppingModel.fromJson(Map<String, dynamic> json) => ShoppingModel(
data: List<ShoppingItemModel>.from(json["data"].map((x) => ShoppingItemModel.fromJson(x))),
);

Map<String, dynamic> toJson() => {
"data": List<dynamic>.from(data!.map((x) => x.toJson())),
};
}

class ShoppingItemModel {
ShoppingItemModel({
this.imageUrl,
this.name,
this.shortDesc,
this.origPrice,
this.discountPrice,
this.discountPercentage,
this.longDesc,
});

String? imageUrl;
String? name;
String? shortDesc;
String? origPrice;
String? discountPrice;
String? discountPercentage;
LongDesc? longDesc;

factory ShoppingItemModel.fromRawJson(String str) => ShoppingItemModel.fromJson(json.decode(str));

String toRawJson() => json.encode(toJson());

factory ShoppingItemModel.fromJson(Map<String, dynamic> json) => ShoppingItemModel(
imageUrl: json["imageURL"],
name: json["name"],
shortDesc: json["shortDesc"],
origPrice: json["OrigPrice"],
discountPrice: json["DiscountPrice"],
discountPercentage: json["discountPercentage"],
longDesc: LongDesc.fromJson(json["longDesc"]),
);

Map<String, dynamic> toJson() => {
"imageURL": imageUrl,
"name": name,
"shortDesc": shortDesc,
"OrigPrice": origPrice,
"DiscountPrice": discountPrice,
"discountPercentage": discountPercentage,
"longDesc": longDesc!.toJson(),
};
}

class LongDesc {
LongDesc({
this.discountDetails,
this.exchangeDtls,
this.sizeDetails,
this.seller,
this.details,
});

String? discountDetails;
String? exchangeDtls;
List<Map<String, String>>? sizeDetails;
String? seller;
List<Detail>? details;

factory LongDesc.fromRawJson(String str) => LongDesc.fromJson(json.decode(str));

String toRawJson() => json.encode(toJson());

factory LongDesc.fromJson(Map<String, dynamic> json) => LongDesc(
discountDetails: json["discountDetails"],
exchangeDtls: json["exchangeDtls"],
sizeDetails: List<Map<String, String>>.from(json["sizeDetails"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v)))),
seller: json["seller"],
details: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
);

Map<String, dynamic> toJson() => {
"discountDetails": discountDetails,
"exchangeDtls": exchangeDtls,
"sizeDetails": List<dynamic>.from(sizeDetails!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
"seller": seller,
"details": List<dynamic>.from(details!.map((x) => x.toJson())),
};
}

class Detail {
Detail({
this.productDetails,
this.sizeFit,
this.materialCare,
this.styleNote,
});

String? productDetails;
String? sizeFit;
String? materialCare;
String? styleNote;

factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

String toRawJson() => json.encode(toJson());

factory Detail.fromJson(Map<String, dynamic> json) => Detail(
productDetails: json["productDetails"] == null ? null : json["productDetails"],
sizeFit: json["Size & Fit"] == null ? null : json["Size & Fit"],
materialCare: json["Material & Care"] == null ? null : json["Material & Care"],
styleNote: json["Style note"] == null ? null : json["Style note"],
);

Map<String, dynamic> toJson() => {
"productDetails": productDetails == null ? null : productDetails,
"Size & Fit": sizeFit == null ? null : sizeFit,
"Material & Care": materialCare == null ? null : materialCare,
"Style note": styleNote == null ? null : styleNote,
};
}
