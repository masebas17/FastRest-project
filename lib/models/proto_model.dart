// To parse this JSON data, do
//
//     final fieldsProto = fieldsProtoFromJson(jsonString);

import 'dart:convert';

import 'package:fastrest/models/descripcion_plato.dart';
import 'package:fastrest/models/valor_plato_model.dart';

FieldsProto fieldsProtoFromJson(String str) => FieldsProto.fromJson(json.decode(str));

String fieldsProtoToJson(FieldsProto data) => json.encode(data.toJson());

class FieldsProto {
    FieldsProto({
        this.valorPlato,
        this.descripcionPlato,
        this.nombrePlato,
        this.img,
    });

    ValorPlato? valorPlato;
    DescripcionPlato? descripcionPlato;
    DescripcionPlato? nombrePlato;
    DescripcionPlato? img;

    factory FieldsProto.fromJson(Map<String, dynamic> json) => FieldsProto(
        valorPlato: ValorPlato.fromJson(json["valor_plato"]),
        descripcionPlato: DescripcionPlato.fromJson(json["descripcion_plato"]),
        nombrePlato: DescripcionPlato.fromJson(json["nombre_plato"]),
        img: DescripcionPlato.fromJson(json["img"]),
    );

    Map<String, dynamic> toJson() => {
        "valor_plato": valorPlato!.toJson(),
        "descripcion_plato": descripcionPlato!.toJson(),
        "nombre_plato": nombrePlato!.toJson(),
        "img": img!.toJson(),
    };
}

