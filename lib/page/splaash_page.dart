import 'dart:async';
import 'package:fastrest/Screens/Login/login_screen.dart';
import 'package:flutter/material.dart';

class SplashP extends StatefulWidget {
  const SplashP({Key? key}) : super(key: key);
  
  @override
  _SplashPState createState() => _SplashPState();
}

class _SplashPState extends State<SplashP> {
  bool _mostrar = false;
  _SplashPState() {
    Timer(const Duration(milliseconds: 3000), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
      });
    });
    Timer(const Duration(milliseconds: 50), () {
      setState(() {
        _mostrar = true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        color: const Color.fromRGBO(140, 3, 3, 1)
      ),
      child: AnimatedOpacity(
        opacity: _mostrar ? 1.0 : 0,
        duration: const Duration(milliseconds: 3000),
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            child: Center(
              child: Image.asset(
                'assets/images/nuevo.png',
                fit: BoxFit.contain,
              ),
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 3.0,
                    offset: const Offset(5.0, 3.0),
                    spreadRadius: 5.0,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
