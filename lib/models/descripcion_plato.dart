// To parse this JSON data, do
//
//     final fieldsProto = fieldsProtoFromJson(jsonString);

import 'dart:convert';

FieldsProto fieldsProtoFromJson(String str) => FieldsProto.fromJson(json.decode(str));

String fieldsProtoToJson(FieldsProto data) => json.encode(data.toJson());

class FieldsProto {
    FieldsProto({
        this.descripcionPlato,
    });

    DescripcionPlato? descripcionPlato;

    factory FieldsProto.fromJson(Map<String, dynamic> json) => FieldsProto(
        descripcionPlato: DescripcionPlato.fromJson(json["descripcion_plato"]),
    );

    Map<String, dynamic> toJson() => {
        "descripcion_plato": descripcionPlato!.toJson(),
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
