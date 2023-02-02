import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routes/name.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  final langugageList = ["English", "Hindi"];
  String? selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset("images/image.png"),
            const SizedBox(
              height: 84,
            ),
            const Text("Please select your Language",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black,
                )),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "You can change the language",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            const Text(
              "at any time.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 4),
              // padding: EdgeInsets.symmetric(
              //   horizontal: screenWidth / 1.5,
              //   vertical: screenHeight / 20,
              // ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
              ),

              width: screenWidth / 1.5,
              height: screenHeight / 20,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  isExpanded: true,
                  value: selectedLanguage,
                  items: langugageList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedLanguage = newValue ?? '';
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                
                context.pushNamed(RouteName.mobileRouteName);
              },
              child: Container(
                width: screenWidth / 6,
                height: screenHeight / 17,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                 
                ),
                child: const Center(
                    child: Text(
                  "NEXT",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                )),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              "images/1.png",
              width: screenWidth,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
