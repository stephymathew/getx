import 'package:get/get.dart';

import 'package:test/model/model.dart';
import 'package:test/repository/student_repository.dart';

class StudentDataController extends GetxController {
  var allStudents = <StudentModel>[].obs;
  StudentRepository studentRepository = StudentRepository();

  // @override
  // void onInit() {
  //   fetchStudents();
  //   super.onInit();
  // }

  fetchStudents() async {
    var student = await studentRepository.getStudent();
    allStudents.value = student;
    print('Fetched students: ${allStudents.length}');
  }

  addStudent(StudentModel studentModel) {
    studentRepository.add(studentModel);
    fetchStudents();
  }

  updateStudent(StudentModel studentModel) {
    studentRepository.update(studentModel);
    fetchStudents();
  }

  deleteStudent(int id) {
    studentRepository.delete(id);
    fetchStudents();
  }
}
