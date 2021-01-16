import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import 'package:moolax/logics/view_models/drawer_viewmodel.dart';
import 'package:moolax/logics/models/drawe_item.dart';
import 'package:moolax/ui/widgets/custom_drawer.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DrawerViewModel model = Provider.of<DrawerViewModel>(context);
    return Material(
      color: Colors.black87,
      child: SafeArea(
        child: Theme(
          data: ThemeData(brightness: Brightness.dark),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: _buildDrawerList(context, model),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDrawerList(BuildContext context, DrawerViewModel model) {
    List<Widget> children = [];
    children
      ..add(Image.asset(
        'assets/flutter_labs_white.png',
        width: 200,
      ))
      ..addAll(model.items.map((DrawerItem item) => ListTile(
            leading: item.icon,
            title: Text(item.text),
            onTap: () {
              DynamicTheme.of(context).setThemeData(item.theme(context));
              model.setSelectedItem(item);
              CustomDrawer.of(context).toogleDrawer();
            },
          )));
    return children;
  }
}
