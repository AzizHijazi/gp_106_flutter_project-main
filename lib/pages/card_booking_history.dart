import 'package:flutter/material.dart';

class CardBookingHistory extends StatelessWidget {
  const CardBookingHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Booking',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            color: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(
              width: 400,
              height: 120,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                          'images/meeting.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'inside Ascendris - ...',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('0.3 km away'),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(
              width: 500,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Booking Details',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Pending Confirmation',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 10,),
                      Text('Sat,07 Dec 2023 07:30 PM'),
                      Divider(),
                      Text('Sat,07 Dec 2023 11:30 PM'),
                      Divider(),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.people),
                          Text(' 8 Seats'),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(
              width: 400,
              height: 100,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Methode',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Icons.account_balance_wallet),
                          Text('  Pay at Host'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(
              width: 400,
              height: 230,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Booking Charges',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 15),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'ILS 175.7 × 2 Hour',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'ILS 351.4',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 15),
                      Text(
                        'Person',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey
                        ),
                      ),

                      SizedBox(height: 10),
                      Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Total Due',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.indigoAccent
                              ),
                            ),
                          ),
                          Text(
                            'ILS 351.4',
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.indigoAccent
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}





