import 'package:flutter/material.dart';
import 'package:fastrest/widgets/principal_widget.dart';

class ItemMenu {
  String title;
  IconData icon;
  ItemMenu(this.icon, this.title);
}

List<ItemMenu> menuOptions = [
  ItemMenu(Icons.restaurant_menu_rounded, "Pagina Principal"),
];

List<Widget> contentWidgets = [
  const PrincipalWidget(),
];
