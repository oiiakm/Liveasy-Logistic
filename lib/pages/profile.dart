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
            height: 200,
          ),
          const Text("Please select your profile",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,
              )),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            width: screenWidth / 1.5,
            height: screenHeight / 9,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: RadioListTile(
               secondary:Image.asset("images/shiper.png",fit:BoxFit.none),
                value: 1,
                groupValue: selectedValue,
                title: const Text(
                  "Shiper",
                ),
                subtitle:
                    const Text("lorem aaaaaaaaaaaaaaaaaaa\naaaaaaajjjjkjkjkjd"),
                onChanged: (value) {
                  selectedValue = value!;
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            width: screenWidth / 1.5,
            height: screenHeight / 9,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: RadioListTile(
              secondary:Image.asset("images/transporter.png",fit: BoxFit.none,),
                value: 2,
                groupValue: selectedValue,
                title: const Text(
                  "Transporter",
                ),
                subtitle:
                    const Text("lorem aaaaaaaaaaaaaaaaaaa\naaaaaaajjjjkjkjkjd"),
                onChanged: (value) {
                  selectedValue = value!;
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: screenWidth / 1.5,
            height: screenHeight / 13,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("CONTINUE",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
