class Room {
  late  int id;
  late  String roomNumber;
  late  String name;
  late  String description;

  late   int size;
  late  bool status;
  late   int price;
  late  String image;


  Room(this.id, this.roomNumber, this.name, this.size, this.status, this.price,
      this.image,this.description);

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomNumber = json['room_number'];
    name = json['name'];
    description = json['description'];
    size = json['size'];
    status = json['status'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['room_number'] = this.roomNumber;
    data['name'] = this.name;
    data['description'] = this.description;
    data['size'] = this.size;
    data['status'] = this.status;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}