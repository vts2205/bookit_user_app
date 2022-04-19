import 'package:bookit_user_app/constants/colors.dart';
import 'package:bookit_user_app/view/outstation_tab_screens/outstation_ride_screen.dart';
import 'package:bookit_user_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OutstationDropOffScreen extends StatelessWidget {
  const OutstationDropOffScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Choose Drop Off Location'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [const SizedBox(height: 30), buildSearchAddress()],
        ),
      ),
    );
  }

  buildSearchAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          cursorColor: green,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              hintText: 'Search Address',
              hintStyle: const TextStyle(fontSize: 17)),
        ),
        const SizedBox(height: 30),
        const Text(
          'Recent Searches',
          style: TextStyle(fontSize: 17, color: Colors.black54),
        ),
        const SizedBox(height: 30),
        ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: blue.withOpacity(0.4),
            child: Icon(
              Icons.location_on,
              size: 30,
              color: blue,
            ),
          ),
          title: const Text(
            'OOTY',
            style: TextStyle(fontSize: 20),
          ),
          onTap: () {
            Get.to(const OutstationRideScreen());
          },
        ),
        const Divider(),
        ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: green.withOpacity(0.4),
            child: Icon(
              Icons.location_on,
              size: 30,
              color: green,
            ),
          ),
          title: const Text(
            'POLLACHI',
            style: TextStyle(fontSize: 20),
          ),
          onTap: () {
            Get.to(const OutstationRideScreen());
          },
        ),
        const Divider(),
        ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.deepPurpleAccent.withOpacity(0.4),
            child: const Icon(
              Icons.location_on,
              size: 30,
              color: Colors.deepPurpleAccent,
            ),
          ),
          title: const Text(
            'THIRUPUR',
            style: TextStyle(fontSize: 20),
          ),
          onTap: () {
            Get.to(const OutstationRideScreen());
          },
        ),
        const Divider(),
      ],
    );
  }
}
