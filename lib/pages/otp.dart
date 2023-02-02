import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasylogistic/pages/mobile.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:go_router/go_router.dart';
import 'package:liveasylogistic/routes/name.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var smsCode = "";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: screenWidth - 35,
              child: IconButton(
                  color: Colors.white,
                  splashRadius: 0.1,
                  padding: EdgeInsets.fromLTRB(0, 0, screenWidth, 0),
                  onPressed: () {
                    context.pushNamed(RouteName.mobileRouteName);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
            ),
            const SizedBox(
              height: 150,
            ),
            const Text("Verify Phone",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                )),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Code is sent to ${MobilePage.mobileNumber}",
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            OTPTextField(
              keyboardType: TextInputType.number,
              length: 6,
              width: screenWidth / 1.2,
              spaceBetween: 5,
              fieldWidth: 55,
              style: const TextStyle(
                fontSize: 17,
              ),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              onChanged: (otp) {
                smsCode = otp;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: screenWidth / 1.5,
              height: screenHeight / 18,
              child: RichText(
                text: const TextSpan(
                    text: "Didn't receive the code?",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: " Request Again",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        // recognizer: TapGestureRecognizer()
                        //   ..onTap = () {
                        //     context.pushNamed(RouteName.);
                        //   }
                      ),
                    ]),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
                onPressed: () async {
                  // try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: MobilePage.verify, smsCode: smsCode);
                  await auth.signInWithCredential(credential);

                  context.pushNamed(RouteName.profileRouteName);
                  // } on FirebaseAuthMultiFactorExceptionPlatform catch (e) {
                  //   if (smsCode.isEmpty) {
                  //     Fluttertoast.showToast(msg: "Please enter the OTP");
                  //   } else {
                  //     Fluttertoast.showToast(msg: e.toString());
                  //   }
                  // }
                },
                child: SizedBox(
                  width: screenWidth / 1.35,
                  height: screenHeight / 18,
                  child: const Center(
                    child: Text(
                      "VERIFY AND CONTINUE",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )),
            const SizedBox(
              height: 317.3,
            ),
            Image.asset(
              "images/3.png",
              width: screenWidth,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
