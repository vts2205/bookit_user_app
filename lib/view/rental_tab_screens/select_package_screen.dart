import 'package:bookit_user_app/constants/colors.dart';
import 'package:bookit_user_app/view/rental_tab_screens/package_screen.dart';
import 'package:bookit_user_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectPackageScreen extends StatelessWidget {
  const SelectPackageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Rental'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Address',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 5),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(height: 5),
            TextButton(
                onPressed: () {
                  Get.to(const PackageScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select Package',
                      style: TextStyle(
                          color: green,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
