import 'package:flutter/material.dart';
import 'package:longtime/api/api_controller.dart';
import 'package:longtime/widgets/belongs_to_workspace.dart';
import 'package:longtime/widgets/workspace_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      clipBehavior: Clip.antiAlias,
      children: [
        Container(
          color: const Color(0xfff2f4ff),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 20.0,
                    bottom: 16.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 3.0,
                        spreadRadius: 2.0,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search, color: Colors.grey),
                      ),
                      hintText: 'Search here',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      // SEARCH BAR
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        FutureBuilder(
          future: ApiController().allHubs(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 18,
                ),
                child: Text(
                  'Workspaces (0)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'tajawal',
                    fontSize: 20,
                  ),
                ),
              );
            }else if(snapshot.hasData ) {
              return  Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 18,
                ),
                child: Text(
                  'Workspaces (${snapshot.data})',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'tajawal',
                    fontSize: 20,
                  ),
                ),
              );
            }else{
              return const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 18,
                ),
                child: Text(
                  'Workspaces (0)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'tajawal',
                    fontSize: 20,
                  ),
                ),
              );
            }
          },),
        const WorkspacesWidget(),
        FutureBuilder(
          future: ApiController().allIndex(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 18,
                ),
                child: Text(
                  'Listings (0)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'tajawal',
                    fontSize: 20,
                  ),
                ),
              );
            } else if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 18,
                ),
                child: Text(
                  'Listings (${snapshot.data.toString()})',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'tajawal',
                    fontSize: 20,
                  ),
                ),
              );
            } else {
              return const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 18,
                ),
                child: Text(
                  'Listings (0)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'tajawal',
                    fontSize: 20,
                  ),
                ),
              );
            }
          },
        ),
        BelongsToWorkSpace(future: ApiController().getAllModels()),
      ],
    );
  }
}