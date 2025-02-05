import 'package:flutter_projects/screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',

        home: Scaffold(appBar: AppBar(title:Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/prof.jpg'),
              radius: 20,

            ),
            SizedBox(width: 10),
            Text('Chats',style: TextStyle(fontWeight:FontWeight.w600),),
          ],
        ),elevation: 20,
          actions: [
            IconButton(onPressed:(){}, icon: Icon(Icons.camera_alt,size: 30)
            ),
            IconButton(onPressed:(){}, icon: Icon(Icons.edit,size: 30)
            )
          ] ,




          backgroundColor: Colors.white70,),
            body: AppScreen ())


    );
  }
}

