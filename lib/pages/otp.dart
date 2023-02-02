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
    var smsCode = "";
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            IconButton(
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
            const Text(
              "Verify Phone",
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Code Send to ${MobilePage.mobileNumber}"),
            OTPTextField(
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 40,
              style: const TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              onCompleted: (otp) {
                smsCode = otp;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: const TextSpan(
                  text: "Didn't receive the code?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: " Request Again",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                      // recognizer: TapGestureRecognizer()
                      //   ..onTap = () {
                      //     context.pushNamed(RouteName.);
                      //   }
                    ),
                  ]),
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: MobilePage.verify,
                            smsCode: smsCode);
                    await auth.signInWithCredential(credential);
                    context.pushNamed(RouteName.profileRouteName);
                  } catch (e) {
                    if (smsCode.isEmpty) {
                      Fluttertoast.showToast(msg: "Please enter the OTP");
                    } else {
                      Fluttertoast.showToast(msg: e.toString());
                    }
                  }
                },
                child: const Text("VERIFY AND CONTINUE")),
           
          ],
        ),
      ),
    );
  }
}
