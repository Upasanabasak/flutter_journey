import 'package:flutter/material.dart';
void main() {
  runApp(AnimatedContainerApp());
}
class AnimatedContainerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedContainerDemo(),
    );
  }
}
class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}
class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  double _width = 100.0;
  double _height = 100.0;
  Color _color = Colors.red;
  void _animateContainer() {
    setState(() {
      _width = _width == 100.0 ? 200.0 : 100.0;
      _height = _height == 100.0 ? 200.0 : 100.0;
      _color = _color == Colors.red ? Colors.blue : Colors.red;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Container')),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          width: _width,
          height: _height,
          color: _color,
          child: Center(child: Image(image: AssetImage("assets/images/rose.jpg"),
            
//color: Colors.orange,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width / 3,)),

        ),

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _animateContainer,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
