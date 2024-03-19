import 'package:flutter/material.dart';

class Elevatedbuttonx extends StatelessWidget {
  Elevatedbuttonx({super.key, required this.tittle,this.onPressed});
  String tittle = "";
   final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 200,
        
        child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              tittle,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )));
  }
}
