import 'package:bookit_user_app/constants/colors.dart';
import 'package:bookit_user_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class PickupLocationScreen extends StatelessWidget {
  const PickupLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: 'Pickup Location'),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: TextField(
          cursorColor: green,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              hintText: 'Pickup Location',
              hintStyle: const TextStyle(fontSize: 17)),
        ),
      ),
    );
  }
}
