import 'package:flutter/material.dart';
import 'package:longtime/api/api_controller.dart';
import 'package:longtime/widgets/build_no_data_text.dart';

Widget buildWorkspaceCategories() {
  return SizedBox(
    height: 120,
    child: FutureBuilder(
      future: ApiController().workSpaceCategory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 7,
            ),
            itemBuilder: (context, index) {
              var category = snapshot.data![index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 3.0,
                color: const Color(0xfff2f4ff),
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: SizedBox(
                          child: Image.network(
                            category.image != null
                                ? 'http://10.0.2.2:8000${category.image}'
                                : 'images/background',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        category.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'avenir-heavy',
                        ),
                      ),
                    ),
                  ],
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