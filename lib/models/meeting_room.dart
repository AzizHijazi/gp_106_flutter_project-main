class MeetingRoom {
  late int id;
  late String name;
  late int size;
  late String description;
  late String info;
  late int hourPrice;
  late int duration;
  late String image;
  late bool status;

  MeetingRoom(this.id, this.name, this.size, this.info, this.hourPrice,
      this.duration, this.image, this.status,this.description);

  MeetingRoom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    size = json['size'];
    description = json['description'];
    info = json['info'];
    hourPrice = json['hour_price'];
    duration = json['duration'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['size'] = this.size;
    data['info'] = this.info;
    data['description'] = this.description;
    data['hour_price'] = this.hourPrice;
    data['duration'] = this.duration;
    data['image'] = this.image;
    data['status'] = this.status;
    return data;
  }
}