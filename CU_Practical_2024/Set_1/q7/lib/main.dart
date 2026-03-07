/*
Develop a Flutter app using Dart programming that functions 
as a stopwatch with start and stop function. The app should 
include a display area to show start and stop button and an 
area where the time duration between start and stop will be shown. 
 */

import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const StopwatchApp());
}

class StopwatchApp extends StatelessWidget {
  const StopwatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 1. Initialize the Stopwatch and a Timer for UI updates
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;

  // Function to update the UI every 30 milliseconds
  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  // Formatting the time duration
  String _formatTime(int milliseconds) {
    var seconds = (milliseconds / 1000).truncate();
    var minutes = (seconds / 60).truncate();
    var hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
  }

  void _handleStartStop() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      _timer?.cancel();
    } else {
      _stopwatch.start();
      _startTimer();
    }
    setState(() {});
  }

  void _handleReset() {
    _stopwatch.reset();
    setState(() {});
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Stopwatch'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Time Display
            Text(
              _formatTime(_stopwatch.elapsedMilliseconds),
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Start/Stop Button
                ElevatedButton(
                  onPressed: _handleStartStop,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _stopwatch.isRunning
                        ? Colors.red
                        : Colors.green,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                  ),
                  child: Text(
                    _stopwatch.isRunning ? 'STOP' : 'START',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),
                // Reset Button
                ElevatedButton(
                  onPressed: _handleReset,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                  ),
                  child: const Text(
                    'RESET',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
