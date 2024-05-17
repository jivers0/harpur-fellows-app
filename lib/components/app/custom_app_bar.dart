import 'package:flutter/material.dart';
import 'package:harpur_fellows_app/notifiers/animation_notifier.dart';
import 'package:harpur_fellows_app/screens/home_page.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimationNotifier>(
      builder: (_, notifier, __) => AppBar(
        actions: [
          IconButton(
              style: IconButton.styleFrom(enableFeedback: false),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false);
              },
              icon: const Icon(Icons.clear))
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(
              tag: notifier.category,
              child: Image.asset('assets/images/${notifier.category}.png')),
        ),
        title: Text(notifier.category),
      ),
    );
  }
}
