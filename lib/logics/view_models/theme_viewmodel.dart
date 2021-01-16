import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:moolax/services/theme/theme_service.dart';
import 'package:moolax/services/service_locator.dart';

class ThemeViewModel extends ChangeNotifier {
  final ThemeService service = serviceLocator<ThemeService>();

  String _theme;
  Map<String, Function> _themes;

  void loadItems() {
    _themes = service.getThemes();
    _theme = service.defaultTheme;
    notifyListeners();
  }

  ThemeData getTheme(BuildContext context) {
    return _themes[_theme](context);
  }

  void setTheme(String theme) {
    _theme = theme;
    notifyListeners();
  }
}
