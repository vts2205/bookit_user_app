import 'package:bookit_user_app/models/list_info.dart';
import 'package:bookit_user_app/view/upcoming_screen.dart';
import 'package:bookit_user_app/widgets/list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingListScreen extends StatelessWidget {
  const UpcomingListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Text(
                'February 2022',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: ListView.builder(
                  itemCount: ListItemModel.list.length,
                  itemBuilder: (context, index) {
                    return ListWidget(
                      item: ListItemModel.list[index],
                      onTap: () {
                        Get.to(const UpcomingScreen());
                      },
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
