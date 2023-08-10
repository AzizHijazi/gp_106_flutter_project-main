import 'dart:ui';
import 'package:longtime/api/api_controller.dart';
import 'package:longtime/models/hub.dart';
import 'package:longtime/pages/show_workspace_page.dart';
import 'package:longtime/widgets/build_no_data_text.dart';
import 'package:flutter/material.dart';

Widget buildHubs() {
  return SizedBox(
    height: 180,
    child: FutureBuilder(
      future: ApiController().hubs(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return GridView.builder(
            itemCount: snapshot.data!.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 7,
            ),
            itemBuilder: (context, index) {
              String? image = snapshot.data![index].image;
              return GestureDetector(
                onTap: () {
                  Hub hub = Hub(
                    snapshot.data![index].id,
                    snapshot.data![index].email,
                    snapshot.data![index].name,
                    snapshot.data![index].location,
                    snapshot.data![index].description,
                    snapshot.data![index].mobile,
                    snapshot.data![index].image,
                    snapshot.data![index].coverImage,
                    snapshot.data![index].intervalType,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowWorkSpacePage(hub: hub),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 3.0,
                  color: const Color(0xfff2f4ff),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: Visibility(
                          visible: image != null,
                          child: image == 0 ? Image.network(
                            'http://10.0.2.2:8000/$image',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ) :
                          Image.asset('images/background.png',
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: SizedBox(
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.only(start: 5.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        snapshot.data![index].name.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'tajawal',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return buildNoDataText();
        }
      },
    ),
  );
}