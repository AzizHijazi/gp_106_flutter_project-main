import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:longtime/api/api_settings.dart';
import 'package:http/http.dart' as http;
import 'package:longtime/api/helpers.dart';
import 'package:longtime/models/User.dart';
import 'package:longtime/models/desk.dart';
import 'dart:convert';
import 'package:longtime/models/hub.dart';
import 'package:longtime/models/meeting_room.dart';
import 'package:longtime/models/order.dart';
import 'package:longtime/models/room.dart';
import 'package:longtime/models/work_space_category.dart';
import 'package:longtime/prefs/pref_controller.dart';

class ApiController with Helpers {

  Future<bool> register(BuildContext context, {required User user}) async {
    final Uri uri = Uri.parse(ApiSettings.register);
    final response = await http.post(uri, body: {
      'name': user.name,
      'email': user.email,
      'password': user.password,
      'password_confirmation': user.passwordConfirmation,
    });
    if (response.statusCode == 201) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }
    return false;
  }

  Future<bool> login(BuildContext context,{required String email,required String password}) async {
    final Uri uri = Uri.parse(ApiSettings.login);
    final response = await http.post(uri,body: {
      'email': email,
      'password': password,
    });
    if(response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body);
      User user = User.fromJson(jsonResponse['object']);
      await SharedPrefController().save(user);
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
      return true;
    }else if (response.statusCode == 400) {
      print(response.body);
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }
    return false;
  }
  
  Future<bool> logout() async {
    Uri uri = Uri.parse(ApiSettings.logout);
    var response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader:
      SharedPrefController().getValueFor<String>(PrefKeys.token.name)!,
      HttpHeaders.acceptHeader: 'application/json',
    });
    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 401) {
      SharedPrefController().clear();
      return true;
    }
    return false;
  }
  
  Future<List<Hub>> hubs() async {
    final Uri uri = Uri.parse(ApiSettings.hubs);
    final response = await http.get(uri, headers: {
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final dataJsonArray = responseData['data'] as List;
      return dataJsonArray.map((jsonObject) => Hub.fromJson(jsonObject)).toList();
    }
    return [];
  }

  Future<List<Room>> getRooms() async {
    final Uri uri = Uri.parse(ApiSettings.allModels);
    final response = await http.get(uri, headers: {
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final roomsJson = responseData['data']['rooms'] as List<dynamic>;
      return roomsJson.map((jsonObject) => Room.fromJson(jsonObject)).toList();
    }
    return [];
  }

  Future<List<Desk>> getDesks() async {
    final Uri uri = Uri.parse(ApiSettings.allModels);
    final response = await http.get(uri, headers: {
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final desksJson = responseData['data']['desks'] as List<dynamic>;
      return desksJson.map((jsonObject) => Desk.fromJson(jsonObject)).toList();
    }
    return [];
  }

  Future<List<MeetingRoom>> getMeetingRooms() async {
    final Uri uri = Uri.parse(ApiSettings.allModels);
    final response = await http.get(uri, headers: {
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

  Future<List<dynamic>> getAllModels() async {

    final List<Room> rooms = await getRooms();
    final List<Desk> desks = await getDesks();
    final List<MeetingRoom> meetingRooms = await getMeetingRooms();
    final List<dynamic> allModels = [];
    allModels.addAll(rooms);
    allModels.addAll(desks);
    allModels.addAll(meetingRooms);
    return allModels;
  }



  Future<int> allIndex() async {
    final Uri uri = Uri.parse(ApiSettings.allModels);
    final response = await http.get(uri, headers: {
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final total = responseData['data']['total'];
      return total;
    }
    return 0;
  }


  Future<int> allHubs() async {
    final Uri uri = Uri.parse(ApiSettings.hubs);
    final response = await http.get(uri, headers: {
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final total = responseData['count'];
      return total;
    }
    return 0;
  }


  Future<List<WorkSpaceCategory>> workSpaceCategory() async {
    final Uri uri = Uri.parse(ApiSettings.workSpaceCategory);
    final response = await http.get(uri, headers: {
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final workSpaceCategory =
      responseData['data'] as List<dynamic>;
      return workSpaceCategory
          .map((jsonObject) => WorkSpaceCategory.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future<List<Order>> myOrders(String type) async {
    final url = ApiSettings.myOrders.replaceFirst('{type}', type);
    final Uri uri = Uri.parse(url);
    final response = await http.get(
      uri,
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzU3NzRkZmU5Y2NlMDJhZjBlMTM4ZDE3YWM3ODQxYThhOGVjYjY3Mjg3MWRlYzczYzc4NTc4ZmU2YTE3ZTdjZjBjNTEyZGNiZDIwMWRiZTgiLCJpYXQiOjE2ODg1ODQ5NDIuNDUxMzE2LCJuYmYiOjE2ODg1ODQ5NDIuNDUxMzIzLCJleHAiOjE3MjAyMDczNDIuNDI1NTU2LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.E0hZ_V8Lb80LND0nONcg2tqvlKM5crjzYccDHWR5j0ttZseKKXVYJf1388IlF8Y3F6y4xz2Ge3yrN1NWScYOFrFd2OWOFzaNAUoIN8zdBzh9DvJ5MftmsERFGIJGeVXIa1ut_glsE9QqJ2pAs4JyZO61sY_Q-z0y96xufy9T0F8mTgta7eJJHCNWaxxPFlipP3nypw2782m1oym5aKbJT0YJpquQDQCChqlNShwFHPn0czriJCDPVucgt2ERdzWMdqjk1GXLHXaT7l7wrq8W1QjVWsZKLZ_UjwTiZnJafBoPfkA2AL80TE2ha93slMyUaLyDvT4wc4Pr6tYVk5TbLD2v0WPz8pDxnmRooZiYHiJw8J6S_3ZdLuqC_e7eS3kUGxiJij-7wNNva8kTOQ_DOI_MPYjJ_fs6lK6i86J8i1sDFydNvbD-muh19Fqmy4Nl52-VlQL7-oZpmHjRm71Iv45M9rz-vaEfKco2UcTTOhU8l_g7AnWAf2oph66ubHtVkxQ_6ppkOaE98wffRS0OtGYiPbaqv-bKfTPb8aeM8MYwOOs4Q0BBUfBcXSguLzZRz3DC-46nejOJmR2fveoAq4nTb3SjNam_i6AEMI9jqgTAQgkJcYEnsQyehB6zPZy3VU6X9v6bjDck0HOnVxbKoZt1QczHwOKvBiGdkX80l1o',
      },
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final order = responseData['data'] as List;
      return order.map((jsonObject) => Order.fromJson(jsonObject)).toList();
    }
    return [];
  }

  Future<List<Order>> myRents(String type) async {
    final url = ApiSettings.myRents.replaceFirst('{type}', type);
    final Uri uri = Uri.parse(url);
    final response = await http.get(
      uri,
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzU3NzRkZmU5Y2NlMDJhZjBlMTM4ZDE3YWM3ODQxYThhOGVjYjY3Mjg3MWRlYzczYzc4NTc4ZmU2YTE3ZTdjZjBjNTEyZGNiZDIwMWRiZTgiLCJpYXQiOjE2ODg1ODQ5NDIuNDUxMzE2LCJuYmYiOjE2ODg1ODQ5NDIuNDUxMzIzLCJleHAiOjE3MjAyMDczNDIuNDI1NTU2LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.E0hZ_V8Lb80LND0nONcg2tqvlKM5crjzYccDHWR5j0ttZseKKXVYJf1388IlF8Y3F6y4xz2Ge3yrN1NWScYOFrFd2OWOFzaNAUoIN8zdBzh9DvJ5MftmsERFGIJGeVXIa1ut_glsE9QqJ2pAs4JyZO61sY_Q-z0y96xufy9T0F8mTgta7eJJHCNWaxxPFlipP3nypw2782m1oym5aKbJT0YJpquQDQCChqlNShwFHPn0czriJCDPVucgt2ERdzWMdqjk1GXLHXaT7l7wrq8W1QjVWsZKLZ_UjwTiZnJafBoPfkA2AL80TE2ha93slMyUaLyDvT4wc4Pr6tYVk5TbLD2v0WPz8pDxnmRooZiYHiJw8J6S_3ZdLuqC_e7eS3kUGxiJij-7wNNva8kTOQ_DOI_MPYjJ_fs6lK6i86J8i1sDFydNvbD-muh19Fqmy4Nl52-VlQL7-oZpmHjRm71Iv45M9rz-vaEfKco2UcTTOhU8l_g7AnWAf2oph66ubHtVkxQ_6ppkOaE98wffRS0OtGYiPbaqv-bKfTPb8aeM8MYwOOs4Q0BBUfBcXSguLzZRz3DC-46nejOJmR2fveoAq4nTb3SjNam_i6AEMI9jqgTAQgkJcYEnsQyehB6zPZy3VU6X9v6bjDck0HOnVxbKoZt1QczHwOKvBiGdkX80l1o',
      },
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final order = responseData['data'] as List;
      return order.map((jsonObject) => Order.fromJson(jsonObject)).toList();
    }
    return [];
  }


}