import 'package:flutter/material.dart';
import 'package:fastrest/constants.dart';

import 'package:fastrest/providers/providers.dart';
import 'package:fastrest/widgets/comida_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class PrincipalWidget extends StatefulWidget {
  const PrincipalWidget({Key? key}) : super(key: key);

  @override
  _PrincipalWidgetState createState() => _PrincipalWidgetState();
}

class _PrincipalWidgetState extends State<PrincipalWidget> {
  final temaController = Get.put(TemaProvider());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://i.pinimg.com/564x/06/27/6e/06276eb0ca585a8aa76e532aafce0950.jpg"),
                  fit: BoxFit.cover),
            ),
            child: const ComidaWidget()),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(height: 50.0),
        ),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          backgroundColor: kPrimaryColor,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.wb_sunny),
              label: "claro",
              onTap: () => temaController.temaClaro(),
            ),
            SpeedDialChild(
              child: const Icon(Icons.mode_night),
              label: "oscuro",
              onTap: () => temaController.temaOscuro(),
            ),
            SpeedDialChild(
              child: const Icon(Icons.settings),
              label: "Ajustes",
              onTap: () => Navigator.pushNamed(context, "/settings"),
            ),
            SpeedDialChild(
              child: const Icon(Icons.location_on),
              label: "Ubicación",
              onTap: () => Navigator.pushNamed(context, "/mapa"),
            ),
          ],
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniEndDocked);
  }
}




/*Widget inicio(){
  return const Text("Bienvenido", style: TextStyle(color: Colors.white, fontSize: 35.0),);
}*/


 

