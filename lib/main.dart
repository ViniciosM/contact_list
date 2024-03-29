import 'package:contact_list_app/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(backgroundColor: Colors.blueAccent[100]),
            scaffoldBackgroundColor: Colors.blueGrey[50],
            useMaterial3: true,
            colorSchemeSeed: Colors.blueAccent),
        home: const HomePage());
  }
}
