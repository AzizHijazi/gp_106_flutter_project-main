class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? birthdate;
  String? image;
  String? gender;
  String? token;
  String? password;
  String? passwordConfirmation;

  User(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.birthdate,
        this.image,
        this.gender,
        this.password,
        this.passwordConfirmation,
        this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    birthdate = json['birthdate'];
    image = json['image'];
    gender = json['gender'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['birthdate'] = birthdate;
    data['image'] = image;
    data['gender'] = gender;
    data['password'] = password;
    data['password_confirmation'] = passwordConfirmation;
    data['token'] = token;
    return data;
  }
}