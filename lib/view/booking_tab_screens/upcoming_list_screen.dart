import 'package:bookit_user_app/constants/colors.dart';
import 'package:bookit_user_app/models/list_info.dart';
import 'package:bookit_user_app/models/upcoming_list_model.dart';
import 'package:bookit_user_app/services/apiservice.dart';
import 'package:bookit_user_app/view/upcoming_screen.dart';
import 'package:bookit_user_app/widgets/list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingListScreen extends StatefulWidget {
  const UpcomingListScreen({Key? key}) : super(key: key);

  @override
  State<UpcomingListScreen> createState() => _UpcomingListScreenState();
}

class _UpcomingListScreenState extends State<UpcomingListScreen> {
  GetUpcomingListModel? getUpcomingListModel;

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    getUpcomingListModel = await APIService().upcomingList();
    if (getUpcomingListModel != null) {
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
                            getUpcomingListModel?.body?.upcomimgTrip?.length,
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
