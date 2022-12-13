import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

final mainProvider =
    ChangeNotifierProvider<MainNotifier>((ref) => MainNotifier());

class MainNotifier extends ChangeNotifier {
  late VideoPlayerController _controller;
  VideoPlayerController get controller => _controller;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  loadVideo() {
    _controller = VideoPlayerController.asset('assets/videos/main.mp4')
      ..initialize().then((_) {
        _controller.setVolume(0);
        _controller.setLooping(true);
        _isLoaded = true;
      });
  }

  playVideo() async {
    await _controller.play();
  }
}
