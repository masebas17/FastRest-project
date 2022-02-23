import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fastrest/Screens/Login/components/background.dart';
import 'package:fastrest/Screens/Signup/signup_screen.dart';
import 'package:fastrest/components/already_have_an_account_acheck.dart';
import 'package:fastrest/components/rounded_button.dart';
import 'package:fastrest/components/text_field_container.dart';
import 'package:fastrest/constants.dart';
import 'package:fastrest/page/home_page.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late bool _succes = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/logo.png",
              height: size.height * 0.35,
            ),
            /*SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),*/
            SizedBox(height: size.height * 0.03),
            TextFieldContainer(
              child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.email, color: kPrimaryColor),
                      hintText: 'usuario@fatapi.com',
                      labelText: 'Correo electrónico',
                      floatingLabelStyle: TextStyle(color: kPrimaryColor),
                      labelStyle: TextStyle(color: kPrimaryColor))),
            ),
            TextFieldContainer(
              child: TextField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          _obscureText = !_obscureText;
                          setState(() {});
                        },
                        icon: _obscureText
                            ? const Icon(Icons.visibility, color: kPrimaryColor)
                            : const Icon(Icons.visibility_off,
                                color: kPrimaryColor)),
                    icon: const Icon(Icons.lock_outline, color: kPrimaryColor),
                    labelText: 'Contraseña',
                    labelStyle: const TextStyle(color: kPrimaryColor),
                  )),
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                try {
                  await _userlogin();
                  if (_succes) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const HomePage();
                        },
                      ),
                    );
                  }
                } on Exception catch (e) {
                  // ignore: avoid_print
                  print(e);
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _userlogin() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user!;

      if (user.uid.isNotEmpty) {
        setState(() {
          _succes = true;
        });
      } else {
        _succes = false;
      }
    } catch (e) {
      //
    }
  }
}
