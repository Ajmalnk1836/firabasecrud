class Usermodel {
  String? id;
  final String? name;
  final int? age;
  final String? classes;
  final int? admissionnumber;
  final String? collegename;
  final String? image;

  Usermodel({
    this.name,
    this.age,
    this.classes,
    this.admissionnumber,
    this.collegename,
    this.image,
    this.id,
  });

  Map<String, dynamic> tojson() => {
        "id": id,
        "user_name": name,
        "age": age,
        "class": classes,
        "admissionNumber": admissionnumber,
        "collegeName": collegename,
        "imageurl": image
      };
  static Usermodel fromJson(Map<String, dynamic> json) => Usermodel(
      id: json["id"],
      name: json["user_name"],
      age: json["age"],
      classes: json["class"],
      admissionnumber: json["admissionNumber"],
      collegename: json["collegeName"],
      image: json["imageurl"]);
}
