class Cat {
  final String name;
  final String color;
  final String age;
  final String gender;

  Cat({
    required this.name,
    required this.color,
    required this.age,
    required this.gender,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      name: json['name'],
      color: json['color'],
      age: json['age'],
      gender: json['gender'],
    );
  }
}
