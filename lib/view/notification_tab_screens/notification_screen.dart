import 'package:bookit_user_app/models/notification_info.dart';
import 'package:bookit_user_app/widgets/notification_list_widget.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: NotificationModel.items.length,
          itemBuilder: (context, index) {
            return NotificationWidget(
              item: NotificationModel.items[index],
            );
          },
        ),
      ),
    );
  }
}
