// To parse this JSON data, do
//
//     final plato = platoFromJson(jsonString);

import 'dart:convert';

List<Plato> platoFromJson(String str) => List<Plato>.from(json.decode(str).map((x) => Plato.fromJson(x)));

String platoToJson(List<Plato> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Plato {
    Plato({
        this.fieldsProto,
    });

    FieldsProto? fieldsProto;

    factory Plato.fromJson(Map<String, dynamic> json) => Plato(
        fieldsProto: FieldsProto.fromJson(json["_fieldsProto"]),
    );

    Map<String, dynamic> toJson() => {
        "_fieldsProto": fieldsProto!.toJson(),
    };
}

class FieldsProto {
    FieldsProto({
        this.nombrePlato,
        this.descripcionPlato,
        this.valorPlato,
        this.img,
    });

    DescripcionPlato? nombrePlato;
    DescripcionPlato? descripcionPlato;
    ValorPlato? valorPlato;
    DescripcionPlato? img;

    factory FieldsProto.fromJson(Map<String, dynamic> json) => FieldsProto(
        nombrePlato: DescripcionPlato.fromJson(json["nombre_plato"]),
        descripcionPlato: DescripcionPlato.fromJson(json["descripcion_plato"]),
        valorPlato: ValorPlato.fromJson(json["valor_plato"]),
        img: DescripcionPlato.fromJson(json["img"]),
    );

    Map<String, dynamic> toJson() => {
        "nombre_plato": nombrePlato!.toJson(),
        "descripcion_plato": descripcionPlato!.toJson(),
        "valor_plato": valorPlato!.toJson(),
        "img": img!.toJson(),
    };
}

class DescripcionPlato {
    DescripcionPlato({
        this.stringValue,
        this.valueType,
    });

    String? stringValue;
    String? valueType;

    factory DescripcionPlato.fromJson(Map<String, dynamic> json) => DescripcionPlato(
        stringValue: json["stringValue"],
        valueType: json["valueType"],
    );

    Map<String, dynamic> toJson() => {
        "stringValue": stringValue,
        "valueType": valueType,
    };
}

class ValorPlato {
    ValorPlato({
        this.doubleValue,
        this.valueType,
    });

    double? doubleValue;
    String? valueType;

    factory ValorPlato.fromJson(Map<String, dynamic> json) => ValorPlato(
        doubleValue: json["doubleValue"].toDouble(),
        valueType: json["valueType"],
    );

    Map<String, dynamic> toJson() => {
        "doubleValue": doubleValue,
        "valueType": valueType,
    };
}
