import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/screens/main/providers/main_provider.dart';
import 'package:video_player/video_player.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(mainProvider.notifier).controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final notifier = ref.watch(mainProvider.notifier);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: notifier.controller.value.size.width,
              height: notifier.controller.value.size.height,
              child: AspectRatio(
                aspectRatio: notifier.controller.value.aspectRatio,
                child: VideoPlayer(notifier.controller),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Hello, I\'m Parrott Kim',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Frontend flutter developer',
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
