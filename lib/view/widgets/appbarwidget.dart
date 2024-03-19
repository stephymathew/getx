import 'package:flutter/material.dart';

class AppbarWiget extends StatelessWidget {
  const AppbarWiget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        
        "Student",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}
