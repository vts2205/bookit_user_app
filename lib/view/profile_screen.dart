import 'package:bookit_user_app/constants/colors.dart';
import 'package:bookit_user_app/controllers/profile_controller.dart';
import 'package:bookit_user_app/models/get_profile_model.dart';
import 'package:bookit_user_app/services/apiservice.dart';
import 'package:bookit_user_app/view/home_screen.dart';
import 'package:bookit_user_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var controller = Get.put(ProfileController());

  GetProfileModel? getProfileModel;

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    getProfileModel = await APIService().fetchProfile();
    if (getProfileModel != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppbarWidget(title: 'Edit Profile'),
        body: buildProfile());
  }

  Obx buildProfile() {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(color: blue),
        );
      }
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
              controller: controller.nameController,
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
              controller: controller.phoneController,
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
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Referral Code : ',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '${getProfileModel?.body?.userData?.referral!}',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Text(
                  'Referred Users : ',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '3',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ],
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
    });
  }
}
