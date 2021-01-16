import 'package:flutter/material.dart';
import 'package:moolax/logics/view_models/drawer_viewmodel.dart';
import 'package:moolax/services/service_locator.dart';
import 'package:provider/provider.dart';

import 'package:moolax/ui/widgets/custom_drawer.dart';
import 'package:moolax/ui/widgets/my_drawer.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DrawerViewModel model = serviceLocator<DrawerViewModel>();

  @override
  void initState() {
    model.loadItems(
        AppBar(
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => CustomDrawer.of(context).toogleDrawer(),
              );
            },
          ),
          title: Text('Hello Flutter'),
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DrawerViewModel>(
        create: (context) => model,
        child: Consumer<DrawerViewModel>(
            builder: (context, model, child) => menu(context, model)));
  }

  Widget menu(BuildContext context, DrawerViewModel model) {
    return CustomDrawer(drawer: MyDrawer(), child: model.selectedItem.widget);
  }
}
