class User {
  String name = "";
  int age = -1;
  String language = "EN";

  User();

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'],
        language = json['language'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
        'language': language,
      };
}
