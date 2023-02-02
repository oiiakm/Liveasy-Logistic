import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:liveasylogistic/routes/name.dart';

class MobilePage extends StatefulWidget {
  const MobilePage({super.key});
  static String verify = "";
  static String mobileNumber = "";
  @override
  State<MobilePage> createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      key: _formKey,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            IconButton(
                color: Colors.white,
                splashRadius: 0.1,
                padding: EdgeInsets.fromLTRB(0, 0, screenWidth, 0),
                onPressed: () {
                  context.pushNamed(RouteName.languageRouteName);
                },
                icon: const Icon(
                  Icons.clear,
                  color: Colors.black,
                )),
            const Text("Please enter your mobile number",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black,
                )),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "You'll receive a 6 digit code",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            const Text(
              "to verify next",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
              child: IntlPhoneField(
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'IN',
                //keyboardType: TextInputType.phone,

                onChanged: (phone) {
                  MobilePage.mobileNumber = phone.completeNumber;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: MobilePage.mobileNumber,
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {
                      MobilePage.verify = verificationId;
                      context.pushNamed(
                        RouteName.otpRouteName,
                      );
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                } catch (e) {
                  if (MobilePage.mobileNumber.isEmpty) {
                    Fluttertoast.showToast(msg: "Please enter a mobile number");
                  } else {
                    Fluttertoast.showToast(msg: e.toString());
                  }
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  // borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Center(
                    child: Text(
                  "CONTINUE",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
