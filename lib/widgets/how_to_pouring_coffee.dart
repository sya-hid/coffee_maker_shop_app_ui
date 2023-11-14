import 'package:cold_n_brew/consts.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HowToPouringCoffee extends StatefulWidget {
  const HowToPouringCoffee({super.key});

  @override
  State<HowToPouringCoffee> createState() => _HowToPouringCoffeeState();
}

class _HowToPouringCoffeeState extends State<HowToPouringCoffee> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(
        'assets/20221214_a70ca07c4ecbd959_391299034083_mp4_264_hd_unlimit_taobao.mp4');
    _videoPlayerController.addListener(() {
      setState(() {});
    });
    _videoPlayerController.setLooping(true);
    _videoPlayerController.initialize().then((value) => setState(() {}));
    _videoPlayerController.play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _videoPlayerController.value.isInitialized
        ? AspectRatio(
            aspectRatio: _videoPlayerController.value.aspectRatio,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                VideoPlayer(_videoPlayerController),
                ClosedCaption(text: _videoPlayerController.value.caption.text),
                ControllerOverly(controller: _videoPlayerController),
                VideoProgressIndicator(_videoPlayerController,
                    allowScrubbing: true),
              ],
            ))
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}

class ControllerOverly extends StatelessWidget {
  final VideoPlayerController controller;
  const ControllerOverly({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSwitcher(
            duration: const Duration(milliseconds: 50),
            reverseDuration: const Duration(milliseconds: 200),
            child: controller.value.isPlaying
                ? const SizedBox.shrink()
                : Container(
                    color: black.withOpacity(.5),
                    child: const Center(
                        child: Icon(
                      Icons.play_arrow,
                      color: white,
                      size: 48,
                      semanticLabel: 'Play',
                    )),
                  )),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        )
      ],
    );
  }
}
