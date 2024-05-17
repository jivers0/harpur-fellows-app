import 'package:flutter/material.dart';
import 'package:harpur_fellows_app/data/animations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/home_page/category_card.dart';
import '../image_animations/fade_in.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String username = "";
  int age = -1;
  int volumeMult = 1;
  List<String> _categories = [];

  @override
  void initState() {
    for (var a in animations) {
      if (!_categories.contains(a.category)) {
        _categories.add(a.category);
      }
    }
    _categories.sort();
    super.initState();
    loadSavedData();
  }

  void toggleMute() {
    setState(() {
      volumeMult == 0 ? volumeMult = 1 : volumeMult = 0;
    });
  }

  Future<void> loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('user') ?? 'Unnamed User';
      age = prefs.getInt('age') ?? -1;
      volumeMult = prefs.getInt('volMult') ?? 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthPadding = size.width * 0.04;

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
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext ctx) =>
                                const SettingsPage()));
                  },
                )),
              ),
              FadeIn(child: Text("Hello $username")),
              Center(
                child: SizedBox(
                    child: TextButton(
                  child: Icon(
                    volumeMult == 1 ? Icons.volume_up : Icons.volume_off,
                    size: size.height * 0.15 * 0.4,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    volumeMult == 1
                        ? prefs.setInt('volMult', 0)
                        : prefs.setInt('volMult', 1);
                    toggleMute();
                  },
                )),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: widthPadding, right: widthPadding),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                expandedHeight: size.height * 0.40,
                flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                  padding: EdgeInsets.all(size.width * 0.1),
                  child:
                      FadeIn(child: Image.asset('assets/images/Welcome.png')),
                )),
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    childCount: _categories.length,
                    (context, index) =>
                        CategoryCard(category: _categories[index])),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 6, mainAxisSpacing: 6),
              )
            ],
          ),
        ));
  }
}
