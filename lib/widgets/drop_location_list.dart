import 'package:bookit_user_app/constants/colors.dart';
import 'package:flutter/material.dart';

class DropLocationTextField extends StatefulWidget {
  final int index;
  DropLocationTextField(this.index);

  @override
  State<DropLocationTextField> createState() => _DropLocationTextFieldState();
}

class _DropLocationTextFieldState extends State<DropLocationTextField> {
  static List<String> dropLocationList = [];

  late TextEditingController _nameController;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _nameController.text = dropLocationList[widget.index];
    });
    return TextField(
      controller: _nameController,
      onChanged: (v) => dropLocationList[widget.index] = v,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          hintText: 'Enter Drop Location',
          border: const OutlineInputBorder(),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: green))),
    );
  }
}
