import 'package:flutter/material.dart';
import 'package:harpur_fellows_app/components/app/custom_app_bar.dart';
import 'package:harpur_fellows_app/components/app/video_player_widget.dart';

class PlayAnimationPage extends StatefulWidget {
  final String name;
  const PlayAnimationPage({required this.name, super.key});

  @override
  State<PlayAnimationPage> createState({name}) => _PlayAnimationPageState();
}

class _PlayAnimationPageState extends State<PlayAnimationPage> {
  @override
  void initState() {
    super.initState();
  }

  void navigateBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(56), child: CustomAppBar()),
        body: Center(
          child: VideoPlayerWidget(
            videoAsset: widget.name,
            onBackButtonPressed: navigateBack,
          ),
        ));
  }
}
