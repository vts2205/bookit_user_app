import 'package:bookit_user_app/constants/colors.dart';
import 'package:bookit_user_app/view/add_money_screen.dart';
import 'package:bookit_user_app/widgets/appbar_widget.dart';
import 'package:bookit_user_app/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppbarWidget(title: 'Payment Method'),
        drawer: const DrawerWidget(),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(height: 30),
              buildWallet(),
              const SizedBox(height: 30),
              buildCash()
            ],
          ),
        ));
  }

  buildWallet() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Transform.scale(
                scale: 1.5,
                child: Radio(
                    activeColor: green,
                    value: 1,
                    groupValue: selectedValue,
                    onChanged: (value) => setState(() {
                          selectedValue = 1;
                        })),
              ),
            ),
            const SizedBox(height: 30),
            const Text('RS 1000',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
            const SizedBox(height: 30),
            Row(
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundColor: blue.withOpacity(0.2),
                    child: Icon(Icons.account_balance_wallet,
                        size: 30, color: blue)),
                const Spacer(),
                const Text('Bookit Wallet', style: TextStyle(fontSize: 20)),
                const Spacer(flex: 6),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: blue, padding: const EdgeInsets.all(15)),
                  onPressed: () {
                    Get.to(const AddMoneyScreen());
                  },
                  child: const Text(
                    'Add Money',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  buildCash() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            CircleAvatar(
                radius: 30,
                backgroundColor: green.withOpacity(0.2),
                child: Icon(Icons.payments_outlined, size: 30, color: green)),
            const Spacer(),
            const Text('Cash', style: TextStyle(fontSize: 20)),
            const Spacer(flex: 6),
            Transform.scale(
              scale: 1.5,
              child: Radio(
                  activeColor: green,
                  value: 2,
                  groupValue: selectedValue,
                  onChanged: (value) => setState(() {
                        selectedValue = 2;
                      })),
            ),
          ],
        ),
      ),
    );
  }
}
