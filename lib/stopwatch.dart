import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

class StopwatchNotifier extends ChangeNotifier {
  late Stopwatch _stopwatch;
  late Timer _timer;
  bool _isRunning = false;

  StopwatchNotifier() {
    _stopwatch = Stopwatch();
    _timer = Timer.periodic(const Duration(milliseconds: 30), (_) {
      notifyListeners();
    });
  }

  String get formattedTime {
    final milli = _stopwatch.elapsed.inMilliseconds;
    final milliseconds = (milli % 1000).toString().padLeft(3, "0");
    final seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    final minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0");
    return "$minutes:$seconds:${milliseconds.substring(0, 2)}";
  }

  bool get isRunning => _isRunning;

  void startStop() {
    if (_isRunning) {
      _stopwatch.stop();
    } else {
      _stopwatch.start();
    }
    _isRunning = !_isRunning;
    notifyListeners();
  }

  void reset() {
    if (_isRunning) {
      _stopwatch.stop();
      _isRunning = false;
    }
    _stopwatch.reset();
    notifyListeners();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

final stopwatchProvider = ChangeNotifierProvider((ref) => StopwatchNotifier());
