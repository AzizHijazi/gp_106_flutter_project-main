import 'package:flutter/material.dart';
import 'package:longtime/api/api_controller.dart';
import 'package:longtime/models/hub.dart';
import 'package:longtime/pages/show_workspace_page.dart';


class WorkspacesWidget extends StatelessWidget {
  const WorkspacesWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 210.0,
          child: FutureBuilder(
            future: ApiController().hubs(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  itemBuilder: (context, index) {
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
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                              child: SizedBox(
                                height: 150.0,
                                width: double.infinity,
                                child: snapshot.data![index].image == 0
                                    ? Image.network(
                                  'http://10.0.2.2:8000/${snapshot.data![index].image}',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                )
                                    : Image.asset(
                                  'images/background.png',
                                  height: double.infinity,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    snapshot.data![index].location.toString(),
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'tajawal',
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data![index].name.toString(),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'tajawal',
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
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
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ));
              }
            },
          ),
        ),
      ],
    );
  }
}