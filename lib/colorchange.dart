import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartStopButtonColorNotifier extends ChangeNotifier {
  Color _color = Colors.green.shade900;

  Color get color => _color;

  void changeColor() {
    _color = _color == Colors.green.shade900
        ? Colors.red.shade900
        : Colors.green.shade900;
    notifyListeners();
  }
}

class TimerTextColorNotifier extends ChangeNotifier {
  Color _color = Colors.green.shade900;

  Color get color => _color;

  void changeColor() {
    _color = _color == Colors.red.shade900
        ? Colors.green.shade900
        : Colors.red.shade900;
    notifyListeners();
  }

  void resetColor() {
    _color = Colors.amber;
    notifyListeners();
  }
}

final startStopButtonColorProvider =
    ChangeNotifierProvider((ref) => StartStopButtonColorNotifier());
final timerTextColorProvider =
    ChangeNotifierProvider((ref) => TimerTextColorNotifier());
