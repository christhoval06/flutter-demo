import 'package:flutter/material.dart';

import './screens/home/home_screen.dart';

class PlantApp extends StatelessWidget {
  final AppBar appBar;

  PlantApp({Key key, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreen(appBar: appBar);
  }
}
