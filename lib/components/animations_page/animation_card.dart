import 'package:flutter/material.dart';
import 'package:harpur_fellows_app/utils/methods.dart';
import '../../image_animations/fade_in.dart';

class AnimationCard extends StatelessWidget {
  const AnimationCard({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: GestureDetector(
        onTap: () {
          playAnimation(context: context, name: name);
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
                          tag: name,
                          child: Image.asset('assets/images/$name.png')),
                    )),
                Container(
                    alignment: Alignment.center,
                    child: Expanded(
                        child: Text(
                      name.replaceAll(RegExp('_'), ' '),
                      textAlign: TextAlign.center,
                    ))),
              ],
            )),
      ),
    );
  }
}
