import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double opacity = 1;
  double scale = 1;
  var offset = Offset.zero;
  var crossFadeState = CrossFadeState.showFirst;
  var child = const Text(
    'Hello!',
    style: TextStyle(fontSize: 50),
  );

  final duration = const Duration(seconds: 1);

  final firstChild = const Text(
    'Hello!',
    style: TextStyle(fontSize: 50),
  );
  final secondChild = const Text(
    'How are you?',
    style: TextStyle(fontSize: 50),
  );

  void playAnimation() {
    setState(() {
      opacity = opacity == 1 ? 0 : 1;
      scale = scale == 1 ? 2 : 1;
      offset = offset == Offset.zero ? const Offset(2, 0) : Offset.zero;
      crossFadeState = crossFadeState == CrossFadeState.showFirst
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst;
      child = child == firstChild ? secondChild : firstChild;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: playAnimation,
        child: const Icon(Icons.play_arrow),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: opacity,
              duration: duration,
              child: AnimatedScale(
                scale: scale,
                duration: duration,
                child: firstChild,
              ),
            ),
            // AnimatedSlide(
            //   offset: offset,
            //   duration: duration,
            //   child: firstChild,
            // ),
            // AnimatedCrossFade(
            //   firstChild: firstChild,
            //   secondChild: secondChild,
            //   crossFadeState: crossFadeState,
            //   duration: duration,
            // ),
            // AnimatedSwitcher(
            //   duration: duration,
            //   child: child,
            //   transitionBuilder: (child, animation) => ScaleTransition(
            //     scale: animation,
            //     child: child,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
