class WorkSpaceCategory {
  late int id;
  late String name;
  late String image;
  late bool status;

  WorkSpaceCategory(this.id, this.name, this.image, this.status);

  WorkSpaceCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['status'] = this.status;
    return data;
  }
}