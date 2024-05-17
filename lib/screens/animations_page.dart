import 'package:flutter/material.dart';
import 'package:harpur_fellows_app/components/app/custom_app_bar.dart';
import 'package:harpur_fellows_app/notifiers/animation_notifier.dart';
import 'package:provider/provider.dart';
import '../components/animations_page/animation_card.dart';
import '../image_animations/fade_in.dart';

class AnimationsPage extends StatefulWidget {
  const AnimationsPage({super.key});

  @override
  State<AnimationsPage> createState() => _AnimationsPageState();
}

class _AnimationsPageState extends State<AnimationsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthPadding = size.width * 0.04;
    return Consumer<AnimationNotifier>(
      builder: (_, notifier, __) => Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(56), child: CustomAppBar()),
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
                      childCount: notifier.animationNamesInCategory.length,
                      (context, index) => AnimationCard(
                          name: notifier.animationNamesInCategory[index])),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6),
                )
              ],
            ),
          )),
    );
  }
}
