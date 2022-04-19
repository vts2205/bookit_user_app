import 'package:bookit_user_app/constants/colors.dart';
import 'package:bookit_user_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class DropLocationScreen extends StatelessWidget {
  const DropLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: 'Drop Location'),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: TextField(
          cursorColor: green,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              hintText: 'Drop Location',
              hintStyle: const TextStyle(fontSize: 17)),
        ),
      ),
    );
  }
}
