import 'dart:async';

import 'package:bookit_user_app/constants/colors.dart';
import 'package:bookit_user_app/services/authservice.dart';
import 'package:bookit_user_app/view/authentication/otp_screen.dart';
import 'package:bookit_user_app/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final box = GetStorage();

  //TextEditingController contact = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  AuthClass authClass = AuthClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Container(),
        SizedBox(height: 50),
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
          // TextField(
          //   controller: contact,
          //   keyboardType: TextInputType.number,
          //   cursorColor: green,
          //   decoration: InputDecoration(
          //       enabledBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(5),
          //       ),
          //       focusedBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(5),
          //         borderSide: BorderSide(color: green, width: 2),
          //       ),
          //       hintText: 'Enter Your Name'),
          // ),
          // const SizedBox(height: 10),
          TextField(
            controller: phonenumber,
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
                hintStyle: TextStyle(fontSize: 20)),
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
          // const SizedBox(height: 10),
          // PinFieldAutoFill(
          //   decoration: BoxLooseDecoration(
          //       gapSpace: 50,
          //       strokeWidth: 2,
          //       strokeColorBuilder: FixedColorBuilder(blue)),
          //   currentCode: codeValue,
          //   codeLength: 4,
          //   onCodeChanged: (code) {
          //     print("onCodeChanged $code");
          //     setState(() {
          //       codeValue = code.toString();
          //     });
          //   },
          //   onCodeSubmitted: (val) {
          //     print("onCodeSubmitted $val");
          //   },
          // ),
          // const SizedBox(
          //   height: 30,
          // ),
          // RichText(
          //     text: TextSpan(children: [
          //   TextSpan(
          //       text: 'Send OTP again in',
          //       style: TextStyle(color: Colors.black, fontSize: 20)),
          //   TextSpan(
          //       text: ' 00:$start',
          //       style: TextStyle(
          //           color: green, fontSize: 20, fontWeight: FontWeight.bold)),
          //   TextSpan(
          //       text: ' seconds',
          //       style: TextStyle(color: Colors.black, fontSize: 20)),
          // ])),
          const SizedBox(height: 30),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: blue),
              onPressed: () {
                genertaeotp(phonenumber.text);

                //signup();
                // Get.to(HomeScreen());
              },
              //submit,
              // var response =
              //     await APIService().createLogin(name.text, contact.text);
              // if (response.statusCode == 200) {
              //   box.write('token', response['token']);
              //   Get.to(const HomeScreen());
              //   print('....Success...');
              // } else {
              //   print('....Failed...');
              // }
              // try {
              //   APIService().createLogin(name.text, contact.text);
              //Get.to(VerifyOTPScreen());
              //} catch (e) {}

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

  // void startTimer() {
  //   const onSec = Duration(seconds: 1);
  //   Timer timer = Timer.periodic(onSec, (timer) {
  //     if (start == 0) {
  //       setState(() {
  //         timer.cancel();
  //         wait = false;
  //       });
  //     } else {
  //       setState(() {
  //         start--;
  //       });
  //     }
  //   });
  // }

  // void setData(verificationId) {
  //   setState(() {
  //     verificationId = verificationId;
  //   });
  //   startTimer();
  // }

  void genertaeotp(phoneno) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      timeout: Duration(seconds: 40),
      phoneNumber: '+91 $phoneno',
      verificationCompleted: (AuthCredential credential) {
        // loadingbar(false);
      },
      verificationFailed: (FirebaseAuthException e) {
        // loadingbar(false);

        if (e.code == 'too-many-requests') {
          // commonFunction.toast(
          //     'Too many attempt for today , please try again after 24HRS',
          //     Colors.red);
        } else {
          // commonFunction.toast('problem when send the code', Colors.red);
        }
      },
      codeSent: (String verificationId, [int? forceResendingToken]) async {
        // var smsCode = 'xxxx';
        // verifyId = verificationId;

        Get.to(VerifyOTPScreen(verifyId: verificationId));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // verifyId = verificationId;
        // loadingbar(false);
      },
    );
  }
}
