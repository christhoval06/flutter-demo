import 'package:flutter/material.dart';

class DrawerItem {
  final Icon icon;

  final Function theme;

  final String text;

  final Widget widget;

  DrawerItem({this.text, this.icon, this.widget, this.theme});

  @override
  String toString() {
    return this.text;
  }
}
