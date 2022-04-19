import 'package:bookit_user_app/constants/colors.dart';
import 'package:bookit_user_app/view/home_screen.dart';
import 'package:bookit_user_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppbarWidget(title: 'Edit Profile'),
        body: buildProfile());
  }

  buildProfile() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          const Text(
            'Name',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 5),
          TextField(
            cursorColor: green,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: green, width: 2),
                    borderRadius: BorderRadius.circular(5))),
          ),
          const SizedBox(height: 20),
          const Text(
            'Phone Number',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 5),
          TextField(
            cursorColor: green,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: green, width: 2),
                    borderRadius: BorderRadius.circular(5))),
          ),
          const SizedBox(height: 20),
          const Text(
            'Address',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 5),
          TextField(
            cursorColor: green,
            maxLines: 5,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: green, width: 2),
                    borderRadius: BorderRadius.circular(5))),
          ),
          const SizedBox(height: 80),
          ElevatedButton(
              onPressed: () {
                Get.off(HomeScreen());
              },
              style: ElevatedButton.styleFrom(
                  primary: green, padding: const EdgeInsets.all(10)),
              child: const Text(
                "Update",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ))
        ],
      ),
    );
  }
}
