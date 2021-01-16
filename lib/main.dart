import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import 'package:moolax/services/service_locator.dart';
import 'package:moolax/ui/views/main_screen.dart';

// import 'package:moolax/app/plant_app/main.dart';

void main() {
  setupServiceLocator();
  //  SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarColor: Colors.white, //top bar color
  //     statusBarIconBrightness: Brightness.dark, //top bar icons
  //     systemNavigationBarColor: Colors.white, //bottom bar color
  //     systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
  //   )
  // );
  // SystemChrome.setPreferredOrientations(
  //         [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
  //     .then((_) => runApp(new MyApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => ThemeData(
        primarySwatch: Colors.indigo,
        brightness: brightness,
      ),
      themedWidgetBuilder: (context, theme) => MaterialApp(
        title: 'Moola X',
        theme: theme,
        home: MainScreen(),
      ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   ThemeViewModel model = serviceLocator<ThemeViewModel>();

//   @override
//   void initState() {
//     model.loadItems();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<ThemeViewModel>(
//         create: (context) => model,
//         child: Consumer<ThemeViewModel>(
//             builder: (context, model, child) => MaterialApp(
//                   title: 'Moola X',
//                   theme: model.getTheme(context),
//                   home: MainScreen(),
//                 )));
//   }
// }
