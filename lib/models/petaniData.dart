class Petani {
  String name;
  int age;
  String imagePath;

  Petani({
    required this.name,
    required this.age,
    required this.imagePath,
  });

  // You can add methods like toJson and fromJson for JSON serialization if needed.
  factory Petani.fromJson(Map<String, dynamic> json) {
    return Petani(
      name: json['name'],
      age: json['age'],
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'imagePath': imagePath,
    };
  }
}
