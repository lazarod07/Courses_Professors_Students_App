class Student{
  final int id;
  final String name;
  final String email;
  final String username;
  final int course_id;
  final String city;
  final String country;
  final String phone;
  final String birthday;


  Student({this.id, this.name, this.email,this.username, this.phone, this.course_id, this.country, this.city, this.birthday});

  String get Name{
    return name;
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
    );
  }

  factory Student.fromJson2(Map<String, dynamic> json) {
    return Student(
      name: json['name'],
      email: json['email'],
      username: json['username'],
      course_id: json['course_id'],
      city: json['city'],
      country: json['country'],
      birthday: json['birthday'],
      phone: json['phone'],
    );
  }
}
