import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:test/constants/constants.dart';
import 'package:test/controller/image_picker.dart';
import 'package:test/controller/student_controller.dart';
import 'package:test/model/model.dart';
import 'package:test/view/view_details.dart';
import 'package:test/view/widgets/appbarwidget.dart';

import 'package:test/view/widgets/formvalidaton.dart';

class AddDetails extends StatefulWidget {
  AddDetails({Key? key}) : super(key: key);

  @override
  AddDetailsState createState() => AddDetailsState();
}

class AddDetailsState extends State<AddDetails> {
 

  @override
  Widget build(BuildContext context) {
    final studentDataController = Get.put(StudentDataController());
     final TextEditingController textController = TextEditingController();
  final TextEditingController registerController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
   PickimageController controller = PickimageController();
  final formKey = GlobalKey<FormState>();
  
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppbarWiget(title: "Add Details"),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsDirectional.all(5),
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              kheight,
              CircleAvatar(
                backgroundColor: Colors.white,
                maxRadius: 80,
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
                        : const Icon(
                            Icons.add_a_photo,
                            size: 30,
                          ),
                  ),
                ),
              ),
              kheight,
              const Text(
                'Add Image',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('User name'),
                      SizedBox(
                        width: 250,
                        height: 50,
                        child: TextFormField(
                          controller: textController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(fontWeight: FontWeight.bold, color: kgreen),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: kred),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: FormValidation.validateUserName,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Register no:'),
                      SizedBox(
                        width: 250,
                        height: 50,
                        child: TextFormField(
                          controller: registerController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(fontWeight: FontWeight.bold, color: kgreen),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: kred),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Phone Number:'),
                      SizedBox(
                        width: 250,
                        height: 50,
                        child: TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(fontWeight: FontWeight.bold, color: kgreen),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: kred),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
                    var id = DateTime.now().millisecond;
                    studentDataController.addStudent(
                      StudentModel(id: id, name: textController.text, register: registerController.text, phonenumber: phoneController.text, image:controller.selectedImagePath.value)
                    );
                    controller.selectedImagePath.value = '';
                    textController.clear();
                    registerController.clear();
                    phoneController.clear();
                    Get.to( ViewDetails());
                    showDialog('Saved', 'Details added Succesfully',
                        const Color.fromARGB(255, 99, 190, 102));
                  }
                },
                child: const Text(
                  'Save Details',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16, color:kblack),
                ),
              ),
                ],
              ),
            ),
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


