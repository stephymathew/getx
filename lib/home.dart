import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/constants/constants.dart';
import 'package:test/view/add_details.dart';
import 'package:test/view/view_details.dart';
import 'package:test/view/widgets/appbarwidget.dart';
import 'package:test/view/widgets/elevated.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppbarWiget(title: "Student"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Elevatedbuttonx(
                tittle: 'Add Details',
                onPressed: () {
                  Get.to(() => AddDetails());
                },
              ),
              kheight,
              Elevatedbuttonx(
                tittle: "View Details",
                onPressed: () {
                  Get.to(() => ViewDetails());
                },
              )
            ],
          ),
        ));
  }
}
