// To parse this JSON data, do
//
//     final siparisModel = siparisModelFromJson(jsonString);

import 'dart:convert';

SiparisModel siparisModelFromJson(String str) => SiparisModel.fromJson(json.decode(str));

String siparisModelToJson(SiparisModel data) => json.encode(data.toJson());

class SiparisModel {
    SiparisModel({
        this.id,
        this.isim,
        this.boy,
        this.kremaPompaSayisi,
        this.kremaSantiPompaSayisi,
        this.sekerSayisi,
        required this.siparisSayisi,
        this.fiyat,
    });

    int? id;
    String? isim;
    String? boy;
    String? kremaPompaSayisi;
    String? kremaSantiPompaSayisi;
    String? sekerSayisi;
    int siparisSayisi;
    double? fiyat;

    factory SiparisModel.fromJson(Map<String, dynamic> json) => SiparisModel(
        id: json["id"],
        isim: json["isim"],
        boy: json["boy"],
        kremaPompaSayisi: json["krema_pompa_sayisi"],
        kremaSantiPompaSayisi: json["krema_santi_pompa_sayisi"],
        sekerSayisi: json["seker_sayisi"],
        siparisSayisi: json["siparis_sayisi"],
        fiyat: json["fiyat"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "isim": isim,
        "boy": boy,
        "krema_pompa_sayisi": kremaPompaSayisi,
        "krema_santi_pompa_sayisi": kremaSantiPompaSayisi,
        "seker_sayisi": sekerSayisi,
        "siparis_sayisi": siparisSayisi,
        "fiyat": fiyat,
    };
}
