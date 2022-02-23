import 'package:cloud_firestore/cloud_firestore.dart';

class ReservaService{
  Future<void> create(
    String uid,
    DateTime day
  ) async{

    try {
      await FirebaseFirestore.instance.collection('reservas').add(
        {
          'uid': uid,
          'day': day,
          'mesa': 1
        });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    
  }
}