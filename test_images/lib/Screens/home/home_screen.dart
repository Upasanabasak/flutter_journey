import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400]),
        // body: const Image(
        //    height: 300, width: 600,
        //   // height: double.infinity, width: double.infinity,

        //   // fit: BoxFit.scaleDown,
        //   // repeat: ImageRepeat.repeatY,

        //   alignment: Alignment.bottomLeft,
        //   // fatching the image from code base
        //   // image:AssetImage('assets/images/image1.jpg'),

        //   // fetching the image from interne
        //   image: NetworkImage('https://thumbs.dreamstime.com/b/pathway-autumn-forest-25866382.jpg'), 
        //   )
        body: const CircleAvatar(
          radius: 100,
          backgroundImage:NetworkImage('https://thumbs.dreamstime.com/b/pathway-autumn-forest-25866382.jpg'),
        ),
    );
  }
}