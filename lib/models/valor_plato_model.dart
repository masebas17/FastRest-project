// To parse this JSON data, do
//
//     final fieldsProto = fieldsProtoFromJson(jsonString);

import 'dart:convert';

FieldsProto fieldsProtoFromJson(String str) => FieldsProto.fromJson(json.decode(str));

String fieldsProtoToJson(FieldsProto data) => json.encode(data.toJson());

class FieldsProto {
    FieldsProto({
        this.valorPlato,
    });

    ValorPlato? valorPlato;

    factory FieldsProto.fromJson(Map<String, dynamic> json) => FieldsProto(
        valorPlato: ValorPlato.fromJson(json["valor_plato"]),
    );

    Map<String, dynamic> toJson() => {
        "valor_plato": valorPlato!.toJson(),
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
