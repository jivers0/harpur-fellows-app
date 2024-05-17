import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget(
      {super.key, required this.videoAsset, required this.onBackButtonPressed});
  final String videoAsset;
  final VoidCallback onBackButtonPressed;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;
  bool showButtons = false;
  int volumeMult = -1;

  @override
  void initState() {
    super.initState();

    loadSavedData();

    _videoPlayerController =
        VideoPlayerController.asset('assets/videos/${widget.videoAsset}.mp4');

    _initializeVideoPlayerFuture =
        _videoPlayerController.initialize().then((_) {
      _videoPlayerController.play();
      _videoPlayerController.setVolume(1.0 * volumeMult);
      _videoPlayerController.setLooping(false);
      setState(() {});
    });

    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.position >=
          _videoPlayerController.value.duration) {
        setState(() {
          showButtons = true;
        });
      }
    });
  }

  Future<void> loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      volumeMult = prefs.getInt('volMult') ?? 1;
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            _videoPlayerController.value.isInitialized) {
          return AspectRatio(
            aspectRatio: _videoPlayerController.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(_videoPlayerController),
                if (showButtons)
                  Center(
                      child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      enableFeedback: false,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: () {
                      _videoPlayerController.seekTo(Duration.zero);
                      _videoPlayerController.play();
                      setState(() {
                        showButtons = false;
                      });
                    },
                    icon: const Icon(
                      Icons.replay,
                      size: 60,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Replay",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  )),
                if (showButtons)
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          enableFeedback: false,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        onPressed: () {
                          widget.onBackButtonPressed();
                        },
                        icon: const Icon(
                          Icons.keyboard_double_arrow_left_sharp,
                          size: 60,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "Back",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ))
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
