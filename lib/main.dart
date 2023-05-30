import 'package:flutter/material.dart';
import 'package:image_videos/image_screen.dart';
import 'package:image_videos/video_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Cached image'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
         title: Text(widget.title),
      ),
    body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        SizedBox(
        height: 50,
          width: 50,
      ),
         ElevatedButton.icon(
           onPressed: () {
             Navigator.push(context,
                 MaterialPageRoute(builder: (context)=> const ImgScr()));
           },
           icon: Icon(
             Icons.image,
             size: 24.0,
           ),
           label: Text('Image'),
         ),
          Padding(padding: EdgeInsets.all(12)),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> VideoScreen()));
            },
            icon: Icon(
              Icons.video_camera_back,
              size: 24.0,
            ),
            label: Text('Videos'),
          )

      ]),
    ));
  }
}
