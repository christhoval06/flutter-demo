import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moolax/logics/models/drawe_item.dart';
import 'package:moolax/services/drawer/drawer_service.dart';
import 'package:moolax/services/service_locator.dart';

class DrawerViewModel extends ChangeNotifier {
  final DrawerService _drawerService = serviceLocator<DrawerService>();

  DrawerItem _selected;
  List<DrawerItem> _items = [];

  void loadItems(AppBar appBar) {
    _items = _drawerService.getAllDrawerItems(appBar);
    _selected = _loadBaseItem(_items);
    notifyListeners();
  }

  DrawerItem get selectedItem {
    return _selected;
  }

  List<DrawerItem> get items {
    return _items;
  }

  DrawerItem _loadBaseItem(List<DrawerItem> items) {
    return items.first;
  }

  void setSelectedItem(DrawerItem item) {
    _selected = item;
    notifyListeners();
  }
}
