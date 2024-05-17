import 'package:flutter/material.dart';
import 'package:harpur_fellows_app/utils/methods.dart';
import '../../image_animations/fade_in.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });

  final String category;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: GestureDetector(
        onTap: () {
          loadSession(context: context, category: category);
        },
        child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Hero(
                          tag: category,
                          child: Image.asset('assets/images/$category.png')),
                    )),
                Expanded(child: Text(category)),
              ],
            )),
      ),
    );
  }
}
