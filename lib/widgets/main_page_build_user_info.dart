import 'package:flutter/material.dart';

Widget buildUserInfo() {
  return Container(
    color: const Color(0xff646BD9),
    child: Column(
      children: [
        const ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(
              'images/profile.png',
            ),
          ),
          title: Text(
            'Hello,Me',
            style: TextStyle(fontFamily: 'avenir-heavy'),
          ),
          subtitle: Text(
            '#GetThingsDone!',
            style: TextStyle(fontFamily: 'avenir-heavy', fontSize: 15),
          ),
        ),
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
  );
}