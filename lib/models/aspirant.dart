

 List<Aspirant> aspirantFromJson(str) =>
   List<Map<String,dynamic>>.from(str).map((json) => Aspirant.fromJson(json)).toList();


class Aspirant{

  String seat;
  String name;
  int age;
  String gender;
  int examId;

  Aspirant({
     this.seat ='',
     this.age=0,
     this.name ='',
     this.gender='',
     this.examId=0,
});

  factory Aspirant.fromJson(Map<String, dynamic> json) => Aspirant(
    seat: json["seat"],
    name: json["name"],
    age: json["age"],
    gender: json["gender"],
    examId: json["examId"],
  );

  Map<String, dynamic> toJson() => {
    "seat": seat,
    "name": name,
    "age": age,
    "gender": gender,
    "examId": examId,
  };

}

class Gender {
  static List<String> get type => ['Select Gender', 'Male', 'Female'];
}