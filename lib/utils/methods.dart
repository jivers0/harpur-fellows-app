import 'package:flutter/material.dart';
import 'package:harpur_fellows_app/notifiers/animation_notifier.dart';
import 'package:provider/provider.dart';
import '../screens/animations_page.dart';
import '../screens/play_animation_page.dart';

loadSession({required BuildContext context, required String category}) {
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => AnimationsPage()));

  final animationNotifier =
      Provider.of<AnimationNotifier>(context, listen: false);
  animationNotifier.setCategory(category: category);
  animationNotifier.generateAllAnimationsInCategory();
}

playAnimation({required BuildContext context, required String name}) {
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => PlayAnimationPage(name: name)));
}
