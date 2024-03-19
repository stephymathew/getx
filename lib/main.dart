import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'flutter Demo',
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(buttonTheme:ButtonThemeData(buttonColor: Colors.green,
      
      
      ),
      appBarTheme: AppBarTheme(color: Colors.red),
      ),
      home: HomeScreen(),
    );
  }
}
