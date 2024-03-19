import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:test/constants/constants.dart';
import 'package:test/controller/image_picker.dart';
import 'package:test/controller/student_controller.dart';
import 'package:test/model/model.dart';
import 'package:test/view/widgets/appbarwidget.dart';

import 'package:test/view/widgets/formvalidaton.dart';

class UpdateStudent extends StatelessWidget {
  final StudentModel student;
  const UpdateStudent({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    final studentDataController = Get.put(StudentDataController());
    final TextEditingController textController =
        TextEditingController(text: student.name);
    final TextEditingController registerController =
        TextEditingController(text: student.register);
    final TextEditingController phoneController =
        TextEditingController(text: student.phonenumber);
    final formKey = GlobalKey<FormState>();

    PickimageController controller = PickimageController();
    controller.selectedImagePath.value = student.image!;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppbarWiget(title: "Add Details"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              kheight,
              CircleAvatar(
                backgroundImage:
                    FileImage(File(controller.selectedImagePath.value)),
                maxRadius: 60,
                child: Obx(
                  () => GestureDetector(
                      onTap: () async {
                        controller.pickImage();
                      },
                      child: controller.selectedImagePath.value != ''
                          ? ClipOval(
                              child: Image.file(
                                File(controller.selectedImagePath.value),
                                fit: BoxFit.cover,
                                width: 140,
                                height: 140,
                              ),
                            )
                          : null),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('User name'),
                  SizedBox(
                    width: 250,
                    height: 50,
                    child: TextFormField(
                      controller: textController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold, color: kgreen),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: kred),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: FormValidation.validateUserName,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Register no:'),
                  SizedBox(
                    width: 250,
                    height: 50,
                    child: TextFormField(
                      controller: registerController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold, color: kgreen),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: kred),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: FormValidation.validateRegisterNumber,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Phone Number:'),
                  SizedBox(
                    width: 250,
                    height: 50,
                    child: TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold, color: kgreen),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: kred),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: FormValidation.validatePhoneNumber,
                    ),
                  ),
                ],
              ),
              kheight,
              ElevatedButton(
                onPressed: () {
                  if (controller.selectedImagePath.value.isEmpty) {
                    showDialog('No Image', 'Please select an Image',
                        const Color.fromARGB(255, 223, 87, 78));
                  }
                  if (formKey.currentState!.validate() &&
                      controller.selectedImagePath.value.isNotEmpty) {
                    studentDataController.updateStudent(StudentModel(
                        id: student.id,
                        name: textController.text,
                        register: registerController.text,
                        phonenumber: phoneController.text,
                        image: controller.selectedImagePath.value));
                    Get.back();
                    showDialog('Updated', 'Details Updated Succesfully',
                        const Color.fromARGB(255, 99, 190, 102));
                  }
                },
                child: const Text(
                  'Update Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showDialog(String title, String message, Color backgroundcolor) {
  Get.snackbar(title, message,
      colorText: kwhite,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundcolor);
}
