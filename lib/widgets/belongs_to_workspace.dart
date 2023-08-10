import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:longtime/api/api_controller.dart';
import 'package:longtime/pages/home_page_listings_card.dart';
import 'package:longtime/widgets/shimmer_image.dart';
import 'package:longtime/widgets/shimmer_item.dart';
import 'package:longtime/widgets/shimmer_list.dart';

import 'package:longtime/api/belongs_hub.dart';
import 'package:longtime/models/desk.dart';
import 'package:longtime/models/meeting_room.dart';
import 'package:longtime/models/room.dart';

class BelongsToWorkSpace extends StatelessWidget {
  final Future<List<dynamic>> future;

  const BelongsToWorkSpace({
    Key? key,
    required this.future,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ShimmerList(
          );
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return ListView.separated(
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 7),
            ),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              String? image = snapshot.data![index].image;
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePageListingsCard(
                        name: snapshot.data![index].name,
                        size: snapshot.data![index].size,
                        description: snapshot.data![index].description,
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: SizedBox(
                          height: 138.0,
                          child: CachedNetworkImage(
                            imageUrl: 'http://10.0.2.2:8000$image',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            placeholder: (context, url) => ShimmerImage(),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      snapshot.data![index].name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.deepPurpleAccent,
                                        fontFamily: 'tajawal',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 4),
                                    child: Text(
                                      '${snapshot.data![index].size.toString()} Seats',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'From',
                                        style: TextStyle(
                                          color: Colors.black,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data![index].price.toString(),
                                        style: const TextStyle(
                                          color: Colors.deepPurpleAccent,
                                          fontSize: 20,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const Text(
                                        'USD',
                                        style: TextStyle(
                                          color: Colors.black,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
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
}