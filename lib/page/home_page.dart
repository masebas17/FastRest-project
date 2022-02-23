import 'package:flutter/material.dart';
import 'package:fastrest/constants.dart';

import 'package:fastrest/widgets/principal_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
  }

  final List<String> _options = [" Menu ", " Pagina Principal "];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_options[_selectedIndex]),
        backgroundColor: kPrimaryColor,
      ),
      body: const PrincipalWidget(),
    );
  }
}
