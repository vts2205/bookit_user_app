import 'package:bookit_user_app/constants/colors.dart';
import 'package:bookit_user_app/models/all_trip_history_model.dart';
import 'package:bookit_user_app/models/list_info.dart';
import 'package:bookit_user_app/services/apiservice.dart';
import 'package:bookit_user_app/view/completed_screen.dart';
import 'package:bookit_user_app/widgets/list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllListScreen extends StatefulWidget {
  const AllListScreen({Key? key}) : super(key: key);

  @override
  State<AllListScreen> createState() => _AllListScreenState();
}

class _AllListScreenState extends State<AllListScreen> {
  GetAllTripListModel? getAllTripListModel;

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    getAllTripListModel = await APIService().allTripList();
    if (getAllTripListModel != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

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
              isLoading == false
                  ? Center(child: CircularProgressIndicator(color: green))
                  : Expanded(
                      child: ListView.builder(
                        itemCount:
                            getAllTripListModel?.body?.alluserTripusers?.length,
                        itemBuilder: (context, index) {
                          return ListWidget(
                            item: ListItemModel.list[index],
                            onTap: () {
                              Get.to(const CompletedScreen());
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
