import 'package:bookit_user_app/view/booking_history_screen.dart';
import 'package:bookit_user_app/view/home_screen.dart';
import 'package:bookit_user_app/view/login_screen.dart';
import 'package:bookit_user_app/view/notification_offer_screen.dart';
import 'package:bookit_user_app/view/payment_method_screen.dart';
import 'package:bookit_user_app/view/profile_screen.dart';
import 'package:bookit_user_app/view/terms_and_conditions_screen.dart';
import 'package:bookit_user_app/view/transaction_history_screen.dart';
import 'package:bookit_user_app/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: 30,
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Get.to(const ProfileScreen());
                },
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 35,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: const [
                        Text(
                          "name",
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          "number",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: 30),
              MenuItem(
                  title: 'Book Your Ride',
                  icon: Icons.drive_eta,
                  onTap: () {
                    Get.to(HomeScreen());
                  },
                  color: Colors.black,
                  size: 20),
              MenuItem(
                  title: 'Booking History',
                  icon: Icons.history_toggle_off,
                  onTap: () {
                    Get.to(BookingHistoryScreen());
                  },
                  color: Colors.black,
                  size: 20),
              MenuItem(
                  title: 'Notifications & Offers',
                  icon: Icons.notification_important,
                  onTap: () {
                    Get.to(const NotificationOfferScreen());
                  },
                  color: Colors.black,
                  size: 20),
              MenuItem(
                  title: 'Payment Method',
                  icon: Icons.payment,
                  onTap: () {
                    Get.to(const PaymentMethodScreen());
                  },
                  color: Colors.black,
                  size: 20),
              MenuItem(
                  title: 'Transaction History',
                  icon: Icons.history,
                  onTap: () {
                    Get.to(const TransactionHistoryScreen());
                  },
                  color: Colors.black,
                  size: 20),
              MenuItem(
                  title: 'Terms and Conditions',
                  icon: Icons.description,
                  onTap: () {
                    Get.to(const TermsAndConditionsScreen());
                  },
                  color: Colors.black,
                  size: 20),
              MenuItem(
                  title: 'Logout',
                  icon: Icons.logout,
                  onTap: () {
                    Get.offAll(const LoginScreen());
                  },
                  color: Colors.black,
                  size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
