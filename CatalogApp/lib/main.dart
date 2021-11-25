import 'package:demo_1/Screens/home.dart';
import 'package:demo_1/Screens/login.dart';
import 'package:demo_1/utils/routes.dart';
import 'package:demo_1/widgets/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: Themes.lightTheme(),
      darkTheme: Themes.darkTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: NavigationRoutes.homeRoute,
      routes: {
        NavigationRoutes.loginRoute: (context) => LoginScreen(),
        NavigationRoutes.homeRoute: (context) => HomeScreen(),
      },
    );
  }
}
