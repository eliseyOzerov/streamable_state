import 'dart:async';

import 'package:flutter/material.dart';
import 'package:streamable_state/streamable.dart';

void main() => runApp(const MyApp());

/// Launching widget
class MyApp extends StatefulWidget {
  /// Default constructor
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// The class responsible for storing the data. Can be stored anywhere.
  final controller = CountController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: controller.add,
                    style: ButtonStyle(
                      padding: MaterialStateProperty.resolveWith(
                        (states) => const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      ),
                    ),
                    child: const Text("add"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),

                    /// The widget to handle the state updates
                    child: Streamed(
                      streamable: controller.count,
                      builder: (value) {
                        return Text(value.toString());
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: controller.subtract,
                    style: ButtonStyle(
                      padding: MaterialStateProperty.resolveWith(
                        (states) => const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      ),
                    ),
                    child: const Text("sub"),
                  ),
                ],
              ),
              Visibility(
                visible: false,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: controller.loop,
                        style: ButtonStyle(
                          padding: MaterialStateProperty.resolveWith(
                            (states) => const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          ),
                        ),
                        child: const Text("loop"),
                      ),
                      TextButton(
                        onPressed: controller.stop,
                        style: ButtonStyle(
                          padding: MaterialStateProperty.resolveWith(
                            (states) => const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          ),
                        ),
                        child: const Text("stop"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CountController {
  /// the value to observe, can also be anything
  final count = Streamable(0);
  late Timer? timer;

  void add([int? i]) {
    final newVal = i ?? 1;
    count.value += newVal;
    count.send();
  }

  void subtract([int? i]) {
    final newVal = i ?? 1;
    count.value -= newVal;
    count.send();
  }

  void loop() {
    timer ??= Timer.periodic(Duration(milliseconds: 10), (timer) {
      add(1);
    });
  }

  void stop() {
    timer?.cancel();
    timer = null;
  }
}
