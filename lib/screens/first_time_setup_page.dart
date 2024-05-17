import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstTimeSetupPage extends StatefulWidget {
  const FirstTimeSetupPage({super.key});
  @override
  State<FirstTimeSetupPage> createState() => FirstTimeSetupPageState();
}

class FirstTimeSetupPageState extends State<FirstTimeSetupPage> {
  String username = "";
  int ageSelected = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Welcome!')),
        body: Center(
          child: Column(children: [
            SizedBox(
                width: 200,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Enter your name',
                      hintText: 'Enter Name'),
                  onChanged: (value) {
                    setState(() {
                      username = value;
                    });
                  },
                )),
            NumberPicker(
                value: ageSelected,
                haptics: true,
                onChanged: (value) => setState(() => ageSelected = value),
                minValue: 18,
                maxValue: 99),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  enableFeedback: false,
                ),
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('user', username);
                  prefs.setInt('age', ageSelected);
                  prefs.setInt('volMult', 1);
                  prefs.setInt('vol', 100);
                  if (!context.mounted) return;
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext ctx) => const HomePage()));
                },
                child: const Text('Continue')),
          ]),
        ));
  }
}
