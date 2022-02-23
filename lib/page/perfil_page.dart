import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fastrest/Screens/Welcome/welcome_screen.dart';
import 'package:fastrest/models/usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:fastrest/constants.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key, required this.currentUsuario}) : super(key: key);
  final CollectionReference currentUsuario;
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Usuario - Ajustes"),
        backgroundColor: kPrimaryColor,
      ),
      body: StreamBuilder(
          stream:
              widget.currentUsuario.where("uid", isEqualTo: userId).snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: Text('Cargando'));
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: snapshot.data!.docs.map((usuario) {
                var cls =
                    Usuario.fromJson(usuario.data() as Map<String, dynamic>);
                return Flexible(
                  child: ListView(children: [
                    Card(
                        child: ListTile(
                            trailing: IconButton(
                                onPressed: () async {
                                  await _auth.signOut();
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WelcomeScreen()));
                                },
                                icon: const Icon(Icons.logout)),
                            leading: const Icon(Icons.person),
                            title: Text(cls.email!),
                            subtitle: const Text("Email"))),
                    Card(
                        child: ListTile(
                            leading: const Icon(Icons.important_devices),
                            title: Text(cls.uid!.toString()),
                            subtitle: const Text("Id"))),
                  ]),
                );
              }).toList(),
            );
          }),
    );
  }
}
