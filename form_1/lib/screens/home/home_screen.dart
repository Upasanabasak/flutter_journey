import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurple, title: Text("Login")),
      body: Column(
        // spacing: 20,
        children: [
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: "username or email",
              hintText: "Enter your user name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: Icon(Icons.email_rounded),
              // suffixIcon: Icon(Icons.close),
              suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.close))
            ),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: "Enter your password",
              hintText: "password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: Icon(Icons.password),
              // suffixIcon: Icon(Icons.close),
              suffixIcon: IconButton(onPressed: (){
                // the logic of clearing
              }, icon: Icon(Icons.close))
            ),
          ),
          SizedBox(height: 40,),
          ElevatedButton(onPressed: (){
            // logic after pressing login button
          }, child: Text("Login"))
        ],
      ),
    );
  }
}
