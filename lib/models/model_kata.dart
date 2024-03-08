// To parse this JSON data, do
//
//     final modelKata = modelKataFromJson(jsonString);

import 'dart:convert';

ModelKata modelKataFromJson(String str) => ModelKata.fromJson(json.decode(str));

String modelKataToJson(ModelKata data) => json.encode(data.toJson());

class ModelKata {
    bool isSuccess;
    String message;
    List<Datum> data;

    ModelKata({
        required this.isSuccess,
        required this.message,
        required this.data,
    });

    factory ModelKata.fromJson(Map<String, dynamic> json) => ModelKata(
        isSuccess: json["is_success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "is_success": isSuccess,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String kosakata;
    String terjemahan;
    String ket;

    Datum({
        required this.id,
        required this.kosakata,
        required this.terjemahan,
        required this.ket,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        kosakata: json["kosakata"],
        terjemahan: json["terjemahan"],
        ket: json["ket"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "kosakata": kosakata,
        "terjemahan": terjemahan,
        "ket": ket,
    };

}
