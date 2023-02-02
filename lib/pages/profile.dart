import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Material(
      child: Column(
        children: [
          const SizedBox(
            height: 250,
          ),
          const Text("Please select your profile",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Colors.black,
              )),
          const SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.center,
            width: screenWidth / 1.1,
            height: screenHeight / 9,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: RadioListTile(
                controlAffinity: ListTileControlAffinity.trailing,
                secondary: Image.asset("images/shiper.png", fit: BoxFit.none),
                value: 1,
                groupValue: selectedValue,
                title: const Text("Shiper",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                    )),
                subtitle:
                    const Text("lorem aaaaaaaaaaaaaaaaaaa\naaaaaaajjjjkjkjkjd",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black38,
                        )),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                }),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            alignment: Alignment.center,
            width: screenWidth / 1.1,
            height: screenHeight / 9,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: RadioListTile(
                controlAffinity: ListTileControlAffinity.trailing,
                secondary: Image.asset(
                  "images/transporter.png",
                  fit: BoxFit.none,
                ),
                value: 2,
                groupValue: selectedValue,
                title: const Text("Transporter",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                    )),
                subtitle:
                    const Text("lorem aaaaaaaaaaaaaaaaaaa\naaaaaaajjjjkjkjkjd",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black38,
                        )),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                }),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: screenWidth / 1.1,
            height: screenHeight / 16,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("CONTINUE",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
