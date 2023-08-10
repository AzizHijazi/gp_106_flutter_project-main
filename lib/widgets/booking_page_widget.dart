import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:longtime/api/api_controller.dart';
import 'package:longtime/models/desk.dart';
import 'package:longtime/models/hub.dart';
import 'package:longtime/models/meeting_room.dart';
import 'package:longtime/models/order.dart';
import 'package:longtime/models/room.dart';
import 'package:longtime/pages/card_booking_history.dart';
import 'package:longtime/pages/card_booking_on_going.dart';
import 'package:longtime/pages/card_booking_pending.dart';

class BookingPageWidget extends StatelessWidget {
  String? status;

  BookingPageWidget({
    super.key,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: status == 'confirmed'
          ? ApiController().myRents(status ?? "confirmed")
          : ApiController().myOrders(status ?? ""),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return ListView.builder(
            padding: const EdgeInsets.all(10.0),
            physics: const ClampingScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CardBookingOnGoing(),
                    ),
                  );
                },
                child: Card(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          SizedBox(
                            height: 160,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(
                                  10.0,
                                ),
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    'http://10.0.2.2:8000${getItemImage(snapshot.data![index])}',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            child: Image(
                              image: NetworkImage(
                                  getItemImage(snapshot.data![index])),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              snapshot.data![index].status.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontFamily: 'avenir-heavy'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                      child: Text(
                        snapshot.data![index].id.toString(),
                        style: const TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'avenir-heavy',
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 10,
                                  width: 10,
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    color: Colors.lightBlueAccent,
                                  ),
                                  color: Colors.lightBlueAccent,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 4),
                                  alignment: Alignment.centerLeft,
                                  height: 3,
                                  width: 3,
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    color: Colors.grey,
                                  ),
                                  color: Colors.grey,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 2),
                                  alignment: Alignment.centerLeft,
                                  height: 3,
                                  width: 3,
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    color: Colors.grey,
                                  ),
                                  color: Colors.grey,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 2),
                                  alignment: Alignment.centerLeft,
                                  height: 3,
                                  width: 3,
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    color: Colors.grey,

                                  ),
                                  color: Colors.grey,
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 2, bottom: 2),
                                  alignment: Alignment.centerLeft,
                                  height: 3,
                                  width: 3,
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    color: Colors.grey,
                                  ),
                                  color: Colors.grey,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 10,
                                  width: 10,
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data![index].startDate
                                          .toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        snapshot.data![index].endDate
                                            .toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                              ),
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'USD\n',
                                    style: TextStyle(
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '${snapshot.data![index].price.toString()}\n',
                                    style: const TextStyle(
                                      color: Colors.deepPurpleAccent,
                                      fontSize: 17,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '${getItemSeats(snapshot.data![index]).toString()} Seats',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(
                              10,
                            ),
                            color: Colors.grey,
                            child: const VerticalDivider(
                              indent: 25,
                              width: 1,
                              endIndent: 25,
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'USD\n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '${snapshot.data![index].price.toString()}\n',
                                  style: const TextStyle(
                                    color: Colors.deepPurpleAccent,
                                    fontSize: 17,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '${getItemSeats(snapshot.data![index]).toString()} Seats',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return const Center(
            child: Text(
              'NO DATA',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          );
        }
      },
    );
  }

  String getItemName(Order order) {
    if (order.itemType == 'App\\Models\\Room') {
      return (order.item as Room).name;
    } else if (order.itemType == 'App\\Models\\Desk') {
      return (order.item as Desk).deskCode;
    } else if (order.itemType == 'App\\Models\\MeetingRoom') {
      return (order.item as MeetingRoom).name;
    } else {
      return 'Unknown Item';
    }
  }

  int? getItemSeats(Order order) {
    if (order.itemType == 'App\\Models\\Room') {
      return (order.item as Room).size;
    } else if (order.itemType == 'App\\Models\\Desk') {
      return (order.item as Desk).size ?? 0;
    } else if (order.itemType == 'App\\Models\\MeetingRoom') {
      return (order.item as MeetingRoom).size;
    } else {
      return 0;
    }
  }

  String getItemImage(dynamic order) {
    if (order.itemType == 'App\\Models\\Room') {
      return (order.item as Room).image;
    } else if (order.itemType == 'App\\Models\\Desk') {
      return (order.item as Desk).image;
    } else if (order.itemType == 'App\\Models\\MeetingRoom') {
      return (order.item as MeetingRoom).image;
    } else {
      return 'Unknown Item';
    }
  }
}
