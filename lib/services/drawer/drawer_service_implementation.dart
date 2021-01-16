import 'package:flutter/material.dart';

import 'package:moolax/logics/models/drawe_item.dart';

import 'package:moolax/ui/views/calculate_screen.dart';
import 'package:moolax/ui/views/hello_world.dart';
import 'package:moolax/ui/views/bmi_input/bmi_input.dart';

import 'drawer_service.dart';

import 'package:moolax/app/plant_app/main.dart';
import 'package:moolax/app/plant_app/constants.dart' as PlantAppConst;

// This class is the concrete implementation of [CurrencyService]. It is a
// wrapper around the WebApi and StorageService services. This way the view models
// don't actually have to know anything about the web or storage details.
class DrawerServiceImpl implements DrawerService {
  static final Function defaultTheme = (BuildContext context) => ThemeData(
        primaryColor: Colors.indigo,
      );

  @override
  List<DrawerItem> getAllDrawerItems(AppBar appBar) {
    return <DrawerItem>[
      DrawerItem(
          icon: Icon(Icons.new_releases),
          text: 'Currency',
          widget: CalculateCurrencyScreen(appBar: appBar),
          theme: defaultTheme),
      DrawerItem(
          icon: Icon(Icons.star),
          text: 'Counter',
          widget: MyHomePage(appBar: appBar),
          theme: defaultTheme),
      DrawerItem(
          icon: Icon(Icons.map),
          text: 'BMI',
          widget: InputPage(appBar: appBar),
          theme: defaultTheme),
      DrawerItem(
          icon: Icon(Icons.map),
          text: 'Plant App',
          widget: PlantApp(appBar: appBar),
          theme: (BuildContext context) => ThemeData(
                scaffoldBackgroundColor: PlantAppConst.kBackgroundColor,
                primaryColor: PlantAppConst.kPrimaryColor,
                // textTheme: Theme.of(context).textTheme.apply(bodyColor: PlantAppConst.kTextColor),
                visualDensity: VisualDensity.adaptivePlatformDensity,
              )),
      // DrawerItem(
      //     icon: Icons.settings,
      //     text: 'Settings',
      //     widget: MyHomePage(appBar: appBar)),
      // DrawerItem(
      //     icon: Icons.person,
      //     text: 'Profile',
      //     widget: CalculateCurrencyScreen(appBar: appBar)),
    ];
  }
}
