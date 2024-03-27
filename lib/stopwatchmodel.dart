import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/colorchange.dart';
import 'package:flutter_application_1/setting.dart';
import 'package:flutter_application_1/stopwatch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metaballs/metaballs.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stopwatch = ref.watch(stopwatchProvider);
    final startStopButtonColor = ref.watch(startStopButtonColorProvider);
    final timerTextColor = ref.watch(timerTextColorProvider);
    final isRunning = stopwatch.isRunning;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "STOPWATCH",
          style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pink,
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 40),
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
              // Add your onPressed functionality here
            },
          ),
        ],
        leading: IconButton(
          padding: EdgeInsets.only(left: 15),
          icon: Icon(
            Icons.watch_later_outlined,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
            // Add your onPressed functionality here
          },
        ),
      ),
      body: SafeArea(
        child: Metaballs(
          color: const Color.fromARGB(255, 66, 133, 244),
          effect: MetaballsEffect.follow(
            growthFactor: 1,
            smoothing: 1,
            radius: 0.5,
          ),
          gradient: const LinearGradient(colors: [
            Colors.greenAccent,
            Colors.blueAccent,
            Colors.pinkAccent,
          ], begin: Alignment.bottomRight, end: Alignment.topLeft),
          metaballs: 30,
          animationDuration: const Duration(milliseconds: 200),
          speedMultiplier: 1,
          bounceStiffness: 3,
          minBallRadius: 15,
          maxBallRadius: 40,
          glowRadius: 0.7,
          glowIntensity: 0.6,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  onPressed: () {
                    stopwatch.startStop();
                    ref
                        .read(startStopButtonColorProvider.notifier)
                        .changeColor();
                    ref.read(timerTextColorProvider.notifier).changeColor();
                  },
                  padding: const EdgeInsets.all(0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 260,
                    width: 260,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isRunning
                            ? Colors.red.shade900
                            : Colors.green.shade900,
                        width: 12,
                      ),
                    ),
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 500),
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: child!,
                        );
                      },
                      child: Text(
                        stopwatch.formattedTime,
                        style: TextStyle(
                          color: timerTextColor.color,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        stopwatch.reset();
                        ref.read(timerTextColorProvider.notifier).resetColor();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.amber
                                .withOpacity(0.8); // Change color when pressed
                          }
                          return Colors.amber;
                        }),
                        elevation:
                            MaterialStateProperty.resolveWith<double>((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return 8; // Increase elevation when pressed
                          }
                          return 4; // Default elevation
                        }),
                        shadowColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return Colors.grey; // Specify shadow color
                        }),
                      ),
                      icon: const Icon(
                        Icons.refresh_rounded,
                        size: 40,
                        color: Colors.white,
                      ), // Adjust size of the icon
                      label: const Text(
                        "Reset",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        stopwatch.startStop();
                        ref
                            .read(startStopButtonColorProvider.notifier)
                            .changeColor();
                        ref.read(timerTextColorProvider.notifier).changeColor();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return isRunning
                                ? Colors.red.withOpacity(0.8)
                                : Colors.green.withOpacity(
                                    0.8); // Change color when pressed
                          }
                          return startStopButtonColor.color;
                        }),
                        elevation:
                            MaterialStateProperty.resolveWith<double>((states) {
                          return states.contains(MaterialState.pressed)
                              ? 8
                              : 4; // Increase elevation when pressed
                        }),
                        shadowColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return Colors.grey; // Specify shadow color
                        }),
                      ),
                      icon: Icon(
                        isRunning ? Icons.stop : Icons.play_arrow,
                        size: 40,
                        color: Colors.white,
                      ),
                      label: Text(
                        isRunning ? "Stop" : "Start",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
