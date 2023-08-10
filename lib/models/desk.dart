class Desk {
  late String name;
  late  int id;
  late  String deskCode;
  late  String description;
  late int price;
  late  bool status;
  late  String image;
  late  int deskTypeId;
  int? size;


  Desk(this.id, this.deskCode, this.price, this.status, this.image,
      this.deskTypeId,this.size,this.name,this.description);

  Desk.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    deskCode = json['desk_code'];
    description = json['description'];
    price = json['price'];
    status = json['status'];
    image = json['image'];
    deskTypeId = json['desk_type_id'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['desk_code'] = this.deskCode;
    data['price'] = this.price;
    data['status'] = this.status;
    data['description'] = this.description;
    data['image'] = this.image;
    data['desk_type_id'] = this.deskTypeId;
    data['size'] = this.size;
    return data;
  }
}