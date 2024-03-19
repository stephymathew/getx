import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/student_controller.dart';
import 'package:test/view/update.dart';
import 'package:test/view/widgets/appbarwidget.dart';

final StudentDataController controller = Get.put(StudentDataController());

class ViewDetails extends StatelessWidget {
  const ViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    controller.fetchStudents();
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppbarWiget(title: "Student List"),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.allStudents.length,
          itemBuilder: (context, index) {
            final student = controller.allStudents[index];
            return Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 187, 185, 185),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              margin: const EdgeInsets.all(10),
              child: SizedBox(
                height: 100,
                width: 100,
                child: Align(
                  alignment: Alignment.center,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: FileImage(File(student.image!)),
                      radius: 40,
                    ),
                    trailing: Wrap(
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.deleteStudent(student.id!);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                        IconButton(
                            onPressed: () {
                              Get.to(UpdateStudent(student: student));
                            },
                            icon: const Icon(Icons.edit))
                      ],
                    ),
                    title: Text(student.name!),
                    subtitle: Text(student.register!),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
