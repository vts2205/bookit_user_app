import 'package:bookit_user_app/constants/colors.dart';
import 'package:bookit_user_app/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        buildImageContainer(),
        buildLoginText(),
        const SizedBox(height: 20),
        buildLogin(context),
      ]),
    ));
  }

  buildImageContainer() {
    return Container(
      width: double.infinity,
      height: 400,
      child: Image.asset(
        "assets/images/loginimg.png",
      ),
    );
  }

  buildLoginText() {
    return Text(
      "Login",
      style: TextStyle(color: green, fontSize: 30, fontWeight: FontWeight.w500),
    );
  }

  buildLogin(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            cursorColor: green,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: green, width: 2),
              ),
              hintText: 'Enter Your Name',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            keyboardType: TextInputType.number,
            cursorColor: green,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: green, width: 2),
              ),
              hintText: 'Enter Your Phone Number',
            ),
          ),
          const SizedBox(height: 10),
          const Divider(thickness: 2),
          const SizedBox(height: 10),
          TextField(
            keyboardType: TextInputType.number,
            cursorColor: green,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: green, width: 2),
              ),
              hintText: 'Enter Referral Code',
            ),
          ),
          const SizedBox(height: 10),
          const Divider(thickness: 2),
          const SizedBox(height: 10),
          PinCodeTextField(
            autofocus: true,
            highlight: true,
            highlightColor: green,
            defaultBorderColor: Colors.black,
            maxLength: 4,
            pinBoxWidth: 60,
            pinBoxHeight: 60,
            hasUnderline: true,
            wrapAlignment: WrapAlignment.spaceAround,
            pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
            pinBoxRadius: 10,
            pinTextStyle: const TextStyle(fontSize: 22.0),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: blue),
              onPressed: () {
                Get.to(const HomeScreen());
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
