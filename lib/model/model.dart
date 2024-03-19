class StudentModel {
  int? id;
  String? name;
  String? register;
  String? phonenumber;
  String? image;

  StudentModel({
    required this.id,
    required this.name,
    required this.register,
    required this.phonenumber,
    required this.image,
  });
  factory StudentModel.fromMap(Map<String, dynamic> json) => StudentModel(
        id: json["id"],
        name: json["name"],
        register: json["register"],
        phonenumber: json["phonenumber"],
        image: json["image"],
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "register": register,
        "phonenumber": phonenumber,
        'image': image,
      };
}
