import 'package:flutter/material.dart';
import 'package:flutter_application_1/stopwatchmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MKSTOPWATCH()));
}

class MKSTOPWATCH extends StatelessWidget {
  const MKSTOPWATCH({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MKStopwatch',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
