import 'package:longtime/models/desk.dart';
import 'package:longtime/models/meeting_room.dart';
import 'package:longtime/models/room.dart';

class Rent {
  late int id;
  late String itemType;
  late int itemId;
  late String status;
  late String details;
  String? response;
  late int price;
  late String startDate;
  late String endDate;
  late int rentTypeId;
  late dynamic item;

  Rent(
      this.id,
        this.itemType,
        this.itemId,
        this.status,
        this.details,
        this.response,
        this.price,
        this.startDate,
        this.endDate,
        this.rentTypeId,
        this.item);

  Rent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemType = json['item_type'];
    itemId = json['item_id'];
    status = json['status'];
    details = json['details'];
    response = json['response'];
    price = json['price'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    rentTypeId = json['rent_type_id'];
    item: _parseItem(json['item_type'], json['item']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_type'] = this.itemType;
    data['item_id'] = this.itemId;
    data['status'] = this.status;
    data['details'] = this.details;
    data['response'] = this.response;
    data['price'] = this.price;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['rent_type_id'] = this.rentTypeId;
    if (this.item != null) {
      data['item'] = this.item!.toJson();
    }
    return data;
  }

  static dynamic _parseItem(String itemType, dynamic itemJson) {
    switch (itemType) {
      case 'App\\Models\\Room':
        return Room.fromJson(itemJson);
      case 'App\\Models\\Desk':
        return Desk.fromJson(itemJson);
      case 'App\Models\\MeetingRoom':
        return MeetingRoom.fromJson(itemJson);
      default:
        return itemJson;
    }
  }
}