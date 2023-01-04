// To parse this JSON data, do
//
//     final universityModel = universityModelFromJson(jsonString);

import 'dart:convert';

List<UniversityModel> universityModelFromJson(String str) => List<UniversityModel>.from(json.decode(str).map((x) => UniversityModel.fromJson(x)));

String universityModelToJson(List<UniversityModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UniversityModel {
    UniversityModel({
        this.alphaTwoCode,
        this.name,
        this.webPages,
        this.stateProvince,
        this.domains,
        this.country,
    });

    AlphaTwoCode? alphaTwoCode;
    String? name;
    List<String>? webPages;
    dynamic stateProvince;
    List<String>? domains;
    Country? country;

    factory UniversityModel.fromJson(Map<String, dynamic> json) => UniversityModel(
        alphaTwoCode: alphaTwoCodeValues.map![json["alpha_two_code"]],
        name: json["name"],
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
        stateProvince: json["state-province"],
        domains: List<String>.from(json["domains"].map((x) => x)),
        country: countryValues.map![json["country"]],
    );

    Map<String, dynamic> toJson() => {
        "alpha_two_code": alphaTwoCodeValues.reverse[alphaTwoCode],
        "name": name,
        "web_pages": List<dynamic>.from(webPages!.map((x) => x)),
        "state-province": stateProvince,
        "domains": List<dynamic>.from(domains!.map((x) => x)),
        "country": countryValues.reverse[country],
    };
}

enum AlphaTwoCode { AU }

final alphaTwoCodeValues = EnumValues({
    "AU": AlphaTwoCode.AU
});

enum Country { AUSTRALIA }

final countryValues = EnumValues({
    "Australia": Country.AUSTRALIA
});

class EnumValues<T> {
    Map<String, T>? map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map!.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap!;
    }
}
