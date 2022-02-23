import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MapaPage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  const MapaPage({Key? key, required String Mapa}) : super(key: key);
  final LatLng fastrest = const LatLng(-1.2429760004677688, -78.63093691112036);
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  String currentLocation = "";

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final FirebaseAuth _auth = FirebaseAuth.instance;
    // ignore: unused_local_variable
    String userId = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(140, 3, 3, 1),
          title: const Text('Ubicación del Restaurante'),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              height: 750,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(140, 3, 3, 1),
                    width: 3,
                  ),
                  color: Theme.of(context).secondaryHeaderColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(2),
                  )),
              child: GoogleMap(
                markers: _libreria(),
                myLocationEnabled: true,
                mapType: MapType.normal,
                initialCameraPosition:
                CameraPosition(target: widget.fastrest, zoom: 18),
              ),
            ),
          ],
        ));
  }

  Set<Marker> _libreria() {
    // ignore: prefer_collection_literals
    var tmp = Set<Marker>();
    tmp.add(Marker(
      markerId: const MarkerId("FastRest"),
      position: widget.fastrest,
      infoWindow: const InfoWindow(
        title: "FastRest Ambato",
      ),
    ));

    return tmp;
  }
}