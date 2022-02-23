import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TemaProvider extends GetxController {
  late SharedPreferences preferences;

  String prefkey = "isDarkModeKey";

  void temaClaro() {
    Get.changeTheme(ThemeData.light());
    preferences.setBool(prefkey, false);
  }

  void temaOscuro() {
    Get.changeTheme(ThemeData.dark());
    preferences.setBool(prefkey, true);
  }

  @override
  void onInit() {
    cargarPreferencias().then((value) => cargarTema());

    super.onInit();
  }

  void cargarTema() {
    bool? isDarkMode = preferences.getBool(prefkey);

    if (isDarkMode == null) {
      preferences.setBool(prefkey, false);
      isDarkMode = false;
    }

    (isDarkMode) ? temaOscuro() : temaClaro();
  }

  Future<void> cargarPreferencias() async {
    preferences = await Get.putAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance());
  }
}
