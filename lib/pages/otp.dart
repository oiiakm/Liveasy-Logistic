import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasylogistic/pages/mobile.dart';
import 'package:go_router/go_router.dart';
import 'package:liveasylogistic/routes/name.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var smsCode = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    smsCode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // var smsCode = "";

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
                    context.pushReplacementNamed(RouteName.mobileRouteName);
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
            Pinput(
              controller: smsCode,
              closeKeyboardWhenCompleted: true,
              length: 6,
              showCursor: true,
              defaultPinTheme: PinTheme(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // onSubmitted: () {
              //   setState(() {
              //     smsCode = otp;
              //   });
              // },
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
                  try {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: MobilePage.verify,
                            smsCode: smsCode.text);
                    await auth.signInWithCredential(credential);

                    // ignore: use_build_context_synchronously
                    context.pushReplacementNamed(RouteName.profileRouteName);
                  } on FirebaseAuthException catch (e) {
                    Fluttertoast.showToast(msg: e.toString());
                  }
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
              height: 305.3,
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
