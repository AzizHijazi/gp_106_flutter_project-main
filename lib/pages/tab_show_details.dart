import 'package:flutter/material.dart';

class WorkSpaceDetails extends StatefulWidget {
  final String description;
  final String location;
  const WorkSpaceDetails({Key? key,required this.description,required this.location}) : super(key: key);

  @override
  State<WorkSpaceDetails> createState() => _WorkSpaceDetailsState();
}

class _WorkSpaceDetailsState extends State<WorkSpaceDetails> {
  bool showMore = false;
  bool showAllAmenities = false;

  final List<String> amenities = [
    'IT Support',
    'High-Speed Internet',
    'Meeting Rooms',
    'Cafeteria',
    'Gym',
    '24/7 Security',
    'Parking Space',
    'Printing Services',
    'Lounge Area',
    'On-site Staff',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'About the WorkSpace',
                style: TextStyle(
                  fontFamily: 'avenir-heavy',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Description:\n${widget.description}\nLocation:\n${widget.location}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showMore = !showMore;
                  });
                },
                child: Text(
                  showMore ? 'Show Less' : 'Show More',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Amenities',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'avenir-heavy',
                ),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                  showAllAmenities ? amenities.length : 4,
                      (index) => ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('images/firstImage.png'),
                      radius: 20,
                    ),
                    title: Text(
                      amenities[index],
                      style: TextStyle(
                        fontFamily: 'tajawal',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              if (!showAllAmenities)
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      context: context,
                      builder: (context) {
                        return ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          separatorBuilder: (context, index) => const Divider(
                            height: 3,
                            thickness: 2,
                          ),
                          itemCount: amenities.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: const CircleAvatar(
                                backgroundImage: AssetImage('images/firstImage.png'),
                                radius: 20,
                              ),
                              title: Text(
                                amenities[index],
                                style: const TextStyle(
                                  fontFamily: 'tajawal',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  child: const Text(
                    'View All Amenities',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              const Divider(
                height: 1,
                thickness: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }

}