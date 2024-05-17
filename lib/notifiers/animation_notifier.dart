import 'package:flutter/material.dart';
import '../models/animation.dart' as ani;
import '../data/animations.dart';

class AnimationNotifier extends ChangeNotifier {
  String category = '';
  ani.Animation animation = ani.Animation(category: '', name: '');
  List<ani.Animation> animationsInCategory = [];
  List<String> animationNamesInCategory = [];

  setCategory({required String category}) {
    this.category = category;
    notifyListeners();
  }

  List<String> generateAllAnimationsInCategory() {
    animationsInCategory.clear();
    animationNamesInCategory.clear();
    animationsInCategory =
        animations.where((element) => element.category == category).toList();

    for (var a in animationsInCategory) {
      animationNamesInCategory.add(a.name);
    }
    return animationNamesInCategory;
  }
}
