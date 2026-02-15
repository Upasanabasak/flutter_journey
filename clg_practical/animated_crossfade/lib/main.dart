import 'package:flutter/material.dart';
void main() {
  runApp(AnimatedCrossFadeApp());
}
class AnimatedCrossFadeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedCrossFadeDemo(),
    );
  }
}
class AnimatedCrossFadeDemo extends StatefulWidget {
  @override
  _AnimatedCrossFadeDemoState createState() => _AnimatedCrossFadeDemoState();
}
class _AnimatedCrossFadeDemoState extends State<AnimatedCrossFadeDemo> {
  bool _showFirst = true;
  void _toggleCrossFade() {
    setState(() {
      _showFirst = !_showFirst;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Animated CrossFade')),
    body: Center(
    child: AnimatedCrossFade(
    duration: Duration(seconds: 6),
    firstChild: Image.network('assets/images/pizza1.avif'),
    secondChild: Image.network('assets/images/pizza2.jpg'),
    crossFadeState:
    _showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    ),
    ),
    floatingActionButton: FloatingActionButton(
    onPressed: _toggleCrossFade,
    child: Icon(Icons.swap_horiz),
    ),
    );
  }
}