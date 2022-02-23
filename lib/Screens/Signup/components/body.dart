import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fastrest/Screens/Login/login_screen.dart';
import 'package:fastrest/Screens/Signup/components/background.dart';
import 'package:fastrest/Screens/Signup/components/or_divider.dart';
import 'package:fastrest/Screens/Signup/components/social_icon.dart';
import 'package:fastrest/components/already_have_an_account_acheck.dart';
import 'package:fastrest/components/rounded_button.dart';
import 'package:fastrest/components/text_field_container.dart';
import 'package:fastrest/constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

// ignore: unused_element
late bool? _success;
// ignore: unused_element
late String _userEmail = '';
late String us = "";
bool _obscureText = true;

class _BodyState extends State<Body> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final email = TextEditingController();
  final person = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Registrar",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/logo.png",
              height: size.height * 0.35,
            ),
            /*SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),*/
            TextFieldContainer(
              child: TextField(
                controller: person,
                decoration: const InputDecoration(
                    icon: Icon(Icons.person, color: kPrimaryColor),
                    hintText: 'usuario',
                    labelText: 'Nombre Usuario',
                    labelStyle: TextStyle(color: kPrimaryColor)),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                controller: email,
                decoration: const InputDecoration(
                    icon: Icon(Icons.email, color: kPrimaryColor),
                    hintText: 'usuario@fatapi.com',
                    labelText: 'Correo electrónico',
                    labelStyle: TextStyle(color: kPrimaryColor)),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                  controller: password,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          _obscureText = !_obscureText;
                          setState(() {});
                        },
                        icon: _obscureText
                            ? const Icon(
                                Icons.visibility,
                                color: kPrimaryColor,
                              )
                            : const Icon(
                                Icons.visibility_off,
                              )),
                    icon: const Icon(Icons.lock_outline, color: kPrimaryColor),
                    labelText: 'Contraseña',
                    labelStyle: const TextStyle(color: kPrimaryColor),
                  )),
            ),
            
            RoundedButton(
              text: "SIGNUP",
              press: () async {
                try {
                  await _registerintheDDB();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                } on Exception catch (e) {
                  // ignore: avoid_print
                  print(e);
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            const OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _sentoserver() async {
    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      CollectionReference reference;
      reference = FirebaseFirestore.instance.collection('usuarios');
      await reference.add({
        "uid": us,
        "email": email.text,
        "password": password.text,
      });
    });
  }

  Future<void> _registerintheDDB() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
      email: email.text,
      password: password.text,
    ))
        .user;
    us = user!.uid;
    // ignore: unnecessary_null_comparison
    if (user != null) {
      await _sentoserver();

      setState(() {
        _success = true;
        _userEmail = user.email ?? '';
      });
    } else {
      _success = false;
    }
  }
}
