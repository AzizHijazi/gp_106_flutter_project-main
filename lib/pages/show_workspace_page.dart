import 'package:flutter/material.dart';
import 'package:longtime/api/belongs_hub.dart';
import 'package:longtime/models/hub.dart';
import 'package:longtime/pages/tab_show_details.dart';
import 'package:longtime/widgets/belongs_to_workspace.dart';

class ShowWorkSpacePage extends StatefulWidget {
  const ShowWorkSpacePage({Key? key, required this.hub}) : super(key: key);
  final Hub hub;

  @override
  State<ShowWorkSpacePage> createState() => _ShowWorkSpacePageState();
}

class _ShowWorkSpacePageState extends State<ShowWorkSpacePage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late Hub hub;

  @override
  void initState() {
    super.initState();
    hub = widget.hub;
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.asset(
              'images/firstImage.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${hub.name}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0,),
            child: Row(
              children: [
                Text(
                  '${hub.location.toString()} -',
                  style: const TextStyle(
                    fontSize: 17,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  hub.intervalType.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(decoration: TextDecoration.underline,fontSize: 16),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 3,
            color: Colors.black26,
          ),
          TabBar(
            isScrollable: false,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            controller: _tabController,
            tabs: const [
              Tab(
                text: 'WorkSpace Listing',
              ),
              Tab(
                text: 'WorkSpace Details',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children:  [
                BelongsToWorkSpace(future: ApiBelongsToHub().fetchRoomsDesksMeetingRoomsForHub(hub.id.toString())),
                WorkSpaceDetails(description: hub.description!,location: hub.location!),
              ],
            ),
          ),
        ],
      ),
    );
  }


}