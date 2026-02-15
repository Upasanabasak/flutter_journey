import 'dart:async';
import 'package:flutter/material.dart';
void main() {
  runApp(DigitalClockApp());
}
class DigitalClockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digital Clock',
      home: DigitalClock(),
    );
  }
}
class DigitalClock extends StatefulWidget {
  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  late String _timeString;
  late Timer _timer;
  late Color _bgcolor;
  late int _countsec;
  @override
  void initState() {
    super.initState();
    _timeString = _formatDateTime(DateTime.now());
    // Update the clock every 1 second
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime());
    _bgcolor=Colors.black;
    _countsec=0;
  }

  @override
  void dispose() {
    _timer.cancel(); // Prevent memory leaks
    super.dispose();
  }

  void _updateTime() {
    final DateTime now = DateTime.now();
    final String formattedTime = _formatDateTime(now);

    setState(() {
      _timeString = formattedTime;
      _countsec++;
      if (_countsec==5){
        _bgcolor=Colors.yellowAccent;
        _countsec=0;
      }
      else
        {
          _bgcolor=Colors.black;
        }

    });
  }

  String _formatDateTime(DateTime dateTime) {
    // Pad numbers with leading zeros
    String hour = dateTime.hour.toString().padLeft(2, '0');
    String minute = dateTime.minute.toString().padLeft(2, '0');
    String second = dateTime.second.toString().padLeft(2, '0');
    return "$hour:$minute:$second";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgcolor,
      body: Center(
        child: Text(
          _timeString,
          style: TextStyle(color: Colors.cyanAccent, fontSize: 60, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
