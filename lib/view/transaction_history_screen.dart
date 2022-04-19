import 'package:bookit_user_app/models/transaction_info.dart';
import 'package:bookit_user_app/widgets/appbar_widget.dart';
import 'package:bookit_user_app/widgets/drawer_widget.dart';
import 'package:bookit_user_app/widgets/transaction_widget.dart';
import 'package:flutter/material.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Transaction History'),
      drawer: const DrawerWidget(),
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
                  itemCount: TransactionModel.items.length,
                  itemBuilder: (context, index) {
                    return TransactionWidget(
                      item: TransactionModel.items[index],
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
