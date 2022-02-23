import 'package:flutter/material.dart';
import 'package:fastrest/models/platos_model.dart';

class CardPlatos extends StatelessWidget {
  const CardPlatos({Key? key, required this.model}) : super(key: key);
  final Plato model;

  @override
  Widget build(BuildContext context) {
    final url = model.fieldsProto?.img!.stringValue.toString();
    return SizedBox(
        height: 700.0,
        child: Card(
          elevation: 9.0,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(url.toString()), fit: BoxFit.fitWidth)),
            child: ListTile(
              title: Text(
                model.fieldsProto!.nombrePlato!.stringValue.toString(),
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text(
                  model.fieldsProto!.descripcionPlato!.stringValue!.toString(),
                  style: Theme.of(context).textTheme.subtitle2),
              trailing: Text(
                  "Valor Plato: " +
                      model.fieldsProto!.valorPlato!.doubleValue.toString() +
                      " \$",
                  style: Theme.of(context).textTheme.headline6),
            ),
          ),
        ));
  }
}
