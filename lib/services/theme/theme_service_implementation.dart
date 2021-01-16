import 'package:flutter/material.dart';

import 'theme_service.dart';

import 'package:moolax/app/plant_app/constants.dart';

// This class is the concrete implementation of [CurrencyService]. It is a
// wrapper around the WebApi and StorageService services. This way the view models
// don't actually have to know anything about the web or storage details.
class ThemeServiceImpl implements ThemeService {
  final String defaultTheme = 'base';

  @override
  Map<String, Function> getThemes() {
    return {
      'base': (BuildContext context) => ThemeData(
            primaryColor: Colors.indigo,
          ),
      'plant_app': (BuildContext context) => ThemeData(
            scaffoldBackgroundColor: kBackgroundColor,
            primaryColor: kPrimaryColor,
            textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
    };
  }
}
