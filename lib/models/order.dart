import 'package:longtime/models/desk.dart';
import 'package:longtime/models/room.dart';

class Order {
  late int id;
  late String itemType;
  late int itemId;
  late String status;
  late String details;
  late int price;
  late String startDate;
  late String endDate;
  int? rentTypeId;
  late dynamic item;

  Order({
    required this.id,
    required this.itemType,
    required this.itemId,
    required this.status,
    required this.details,
    required this.price,
    required this.startDate,
    required this.endDate,
    this.rentTypeId,
    this.item,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      itemType: json['item_type'],
      itemId: json['item_id'],
      status: json['status'],
      details: json['details'],
      price: json['price'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      rentTypeId: json['rent_type_id'],
      item: _parseItem(json['item_type'], json['item']),
    );
  }

  static dynamic _parseItem(String itemType, dynamic itemJson) {
    switch (itemType) {
      case 'App\\Models\\Room':
        return Room.fromJson(itemJson);
      case 'App\\Models\\Desk':
        return Desk.fromJson(itemJson);
      default:
        return itemJson;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'item_type': itemType,
      'item_id': itemId,
      'status': status,
      'details': details,
      'price': price,
      'start_date': startDate,
      'end_date': endDate,
      'rent_type_id': rentTypeId,
    };

    if (item != null) {
      data['item'] = item.toJson();
    }

    return data;
  }
}