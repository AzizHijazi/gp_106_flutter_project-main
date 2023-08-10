import 'package:flutter/material.dart';
import 'package:longtime/pages/select_date_time.dart';

class HomePageListingsCard extends StatefulWidget {
  final String name;
  final int size;
  final String description;

  const HomePageListingsCard({Key? key,required this.name,required this.size,required this.description}) : super(key: key);


  @override
  State<HomePageListingsCard> createState() => _HomePageListingsCardState();
}

class _HomePageListingsCardState extends State<HomePageListingsCard> {
  final List<String> images = [
    'images/out_boarding/imageTwo.png',
    'images/out_boarding/imageOne.png',
    'images/out_boarding/imageTwo.png',
    'images/out_boarding/imageOne.png',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back,color: Colors.black),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share,color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SelectDateTime()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 60),
                  backgroundColor: const Color(0xff646BD9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Select Date',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               SizedBox(
                 height: 270,
                 child: Stack(
                   children: [
                     PageView.builder(
                       itemCount: images.length,
                       onPageChanged: (index) {
                         setState(() {
                           currentIndex = index;
                         });
                       },
                       itemBuilder: (context, index) {
                         return Image.asset(
                           images[index],
                           fit: BoxFit.cover,
                         );
                       },
                     ),

               ],
                 ),
               ),
                SizedBox(height: 16),
               Padding(
                 padding: const EdgeInsets.all(10),
                 child: Text(
                   widget.name,
                   style: const TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ),
               const SizedBox(height: 8),
               GestureDetector(
                 onTap: () {
                   showModalBottomSheet(
                     context: context,
                     builder: (BuildContext context) {
                       return SizedBox(
                         height: 200,
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             const Text(
                               '50% off your first 3 bookings\n (up to ILS 65)',
                               style: TextStyle(fontSize: 20),
                             ),
                             const SizedBox(height: 16),
                             ElevatedButton(
                               onPressed: () {},
                               style: ElevatedButton.styleFrom(
                                 minimumSize: const Size(150, 50),
                                 backgroundColor: const Color(0xff646BD9),
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                               ),
                               child: const Text('Apply',style: TextStyle(fontSize: 17),),
                             ),
                           ],
                         ),
                       );
                     },
                   );
                 },
                 child: Container(
                   color: Colors.orange.shade200,
                   padding: const EdgeInsets.all(13),
                   child: const Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: [
                           Icon(
                             Icons.card_giftcard,
                             color: Colors.orange,
                           ),
                           SizedBox(width: 8),
                           Text(
                             'Save When Booking This Listing',
                             style: TextStyle(
                               fontSize: 16,
                               color: Colors.black,
                             ),
                           ),
                         ],
                       ),
                       Icon(
                         Icons.arrow_forward_ios,
                         color: Colors.orange,
                       ),
                     ],
                   ),
                 ),
               ),
               const SizedBox(height: 16),
               const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16),
                 child: Text(
                   'About the Listing',
                   style: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ),
               const SizedBox(height: 8),
                Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 16),
                 child: Text(
                   widget.description,
                   style: TextStyle(
                     fontSize: 14,
                     color: Colors.grey,
                   ),
                 ),
               ),
               const SizedBox(height: 15),
               SizedBox(
                 width: 100,
                 height: 50,
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(8),
                   child: Container(
                     color: Colors.grey.shade100,
                     padding: const EdgeInsets.only(left: 15),
                     child:  Row(
                       children: [
                         const Icon(Icons.person, size: 16),
                         const SizedBox(width: 4),
                         Flexible(
                           child: Text(
                             '${widget.size} Seats',
                             overflow: TextOverflow.ellipsis,
                             style: const TextStyle(
                               fontSize: 14,
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
               const SizedBox(height: 8),
               const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16),
                 child: Text(
                   'Amenities',
                   style: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ),
               const SizedBox(height: 8),
               const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16),
                 child: Row(
                   children: [
                     Icon(Icons.print),
                     SizedBox(width: 8),
                     Text(
                       'Print, Scanner and Photocopler',
                       style: TextStyle(
                         fontSize: 14,
                         color: Colors.black54,
                       ),
                     ),
                   ],
                 ),
               ),
               const SizedBox(height: 8),
               const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16),
                 child: Row(
                   children: [
                     Icon(Icons.wifi),
                     SizedBox(width: 8),
                     Text(
                       'Wifi',
                       style: TextStyle(
                         fontSize: 14,
                         color: Colors.black54,
                       ),
                     ),
                   ],
                 ),
               ),
               const SizedBox(height: 8),
               const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16),
                 child: Row(
                   children: [
                     Icon(Icons.coffee_maker_rounded),
                     SizedBox(width: 8),
                     Text(
                       'Free Coffee',
                       style: TextStyle(
                         fontSize: 14,
                         color: Colors.black54,
                       ),
                     ),
                   ],
                 ),
               ),
               const SizedBox(height: 8),
               const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16),
                 child: Row(
                   children: [
                     Icon(Icons.tv),
                     SizedBox(width: 8),
                     Text(
                       'Led Screens',
                       style: TextStyle(
                         fontSize: 14,
                         color: Colors.black54,
                       ),
                     ),
                   ],
                 ),
               ),
               const SizedBox(height: 8),
               const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16),
                 child: Row(
                   children: [
                     Icon(Icons.microwave),
                     SizedBox(width: 8),
                     Text(
                       'Pantry',
                       style: TextStyle(
                         fontSize: 14,
                         color: Colors.black54,
                       ),
                     ),
                   ],
                 ),
               ),
               const SizedBox(height: 8),
               const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16),
                 child: Row(
                   children: [
                     Icon(Icons.desk),
                     SizedBox(width: 8),
                     Text(
                       'Reception',
                       style: TextStyle(
                         fontSize: 14,
                         color: Colors.black54,
                       ),
                     ),

                   ],
                 ),
               ),
               const SizedBox(height: 8),
               const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16),
                 child: Row(
                   children: [
                     Icon(Icons.garage),
                     SizedBox(width: 8),
                     Text(
                       'Paid Parking',
                       style: TextStyle(
                         fontSize: 14,
                         color: Colors.black54,
                       ),
                     ),
                   ],
                 ),
               ),
               const SizedBox(height: 8),
               const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16),
                 child: Row(
                   children: [
                     Icon(Icons.cleaning_services),
                     SizedBox(width: 8),
                     Text(
                       'Cleaning',
                       style: TextStyle(
                         fontSize: 14,
                         color: Colors.black54,
                       ),
                     ),
                   ],
                 ),
               ),
               const SizedBox(height: 8),
               const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16),
                 child: Row(
                   children: [
                     Text(
                       '\n',
                       style: TextStyle(
                         fontSize: 14,
                         color: Colors.black54,
                       ),
                     ),
                   ],
                 ),
               ),
             ],
           ),
         ),
      );
  }
}
