import 'dart:io';
import 'package:longtime/api/api_settings.dart';
import 'package:http/http.dart' as http;
import 'package:longtime/models/desk.dart';
import 'dart:convert';
import 'package:longtime/models/meeting_room.dart';
import 'package:longtime/models/room.dart';

class ApiBelongsToHub{

  Future<List<Room>> getRoomsForHub(String id) async {
    final url = '${ApiSettings.allForHub.replaceFirst('{id}', id)}';
    final response = await http.get(Uri.parse(url), headers: {
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final roomsJson = responseData['data']['rooms'] as List<dynamic>;
      return roomsJson.map((jsonObject) => Room.fromJson(jsonObject)).toList();
    }
    return [];
  }

  Future<List<Desk>> getDesksForHub(String id) async {
    final url = '${ApiSettings.allForHub.replaceFirst('{id}', id)}';
    final response = await http.get(Uri.parse(url), headers: {
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final desksJson = responseData['data']['desks'] as List<dynamic>;
      return desksJson.map((jsonObject) => Desk.fromJson(jsonObject)).toList();
    }
    return [];
  }

  Future<List<MeetingRoom>> getMeetingRoomsForHub(String id) async {
    final url = '${ApiSettings.allForHub.replaceFirst('{id}', id)}';
    final response = await http.get(Uri.parse(url), headers: {
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final meetingRoomsJson =
      responseData['data']['meetingRooms'] as List<dynamic>;
      return meetingRoomsJson
          .map((jsonObject) => MeetingRoom.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future<List<dynamic>> fetchRoomsDesksMeetingRoomsForHub(String hubId) async {
    final List<dynamic> data = [];
    final List<Room> rooms = await getRoomsForHub(hubId);
    final List<Desk> desks = await getDesksForHub(hubId);
    final List<MeetingRoom> meetingRooms = await getMeetingRoomsForHub(hubId);

    data.addAll(rooms);
    data.addAll(desks);
    data.addAll(meetingRooms);

    return data;
  }
}