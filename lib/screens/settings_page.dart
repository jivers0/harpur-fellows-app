import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:numberpicker/numberpicker.dart';
import 'home_page.dart';
import '../image_animations/fade_in.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State<SettingsPage> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  String username = "";
  int ageSelected = 18;
  int volumeMult = 1;
  int volume = 100;

  @override
  void initState() {
    super.initState();
    loadSavedData();
  }

  Future<void> loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('user') ?? 'Unnamed User';
      ageSelected = prefs.getInt('age') ?? -1;
      volumeMult = prefs.getInt('volMult') ?? 1;
      volume = prefs.getInt('vol') ?? -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          toolbarHeight: size.height * 0.15,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: SizedBox(
                    child: TextButton(
                  child: Icon(
                    Icons.settings,
                    size: size.height * 0.15 * 0.4,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )),
              ),
              const FadeIn(child: Text("Settings")),
              Center(
                child: SizedBox(
                    child: IconButton(
                        style: IconButton.styleFrom(enableFeedback: false),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                              (route) => false);
                        },
                        icon: const Icon(Icons.clear))),
              ),
            ],
          ),
        ),
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
                  prefs.setInt('volMult', volumeMult);
                  prefs.setInt('vol', volume);
                  if (!context.mounted) return;
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext ctx) => const HomePage()));
                },
                child: const Text('Save Changes')),
          ]),
        ));
  }
}
