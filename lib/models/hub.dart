class Hub {
  int? id;
  String? email;
  String? name;
  String? location;
  String? description;
  String? mobile;
  String? image;
  String? coverImage;
  String? intervalType;


  Hub(this.id, this.email, this.name, this.location, this.description,
      this.mobile, this.image, this.coverImage, this.intervalType);

  Hub.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    location = json['location'];
    description = json['description'];
    mobile = json['mobile'];
    image = json['image'];
    coverImage = json['cover_image'];
    intervalType = json['interval_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['name'] = this.name;
    data['location'] = this.location;
    data['description'] = this.description;
    data['mobile'] = this.mobile;
    data['image'] = this.image;
    data['cover_image'] = this.coverImage;
    data['interval_type'] = this.intervalType;
    return data;
  }
}