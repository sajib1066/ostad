import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HUMMING BIRD',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("HUMMING BIRD."),
        actions: [
          if (MediaQuery.of(context).size.width > 600)
            Row(
              children: [
                TextButton(onPressed: () {}, child: const Text('Episodes')),
                TextButton(onPressed: () {}, child: const Text('About')),
              ],
            )
        ],
      ),
      drawer: MediaQuery.of(context).size.width <= 600
          ? Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.green,  // Set the background color to green
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'SKILL UP NOW',
                  style: TextStyle(color: Colors.white),  // Optional: Set text color to white
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.video_camera_back_outlined),
              title: const Text('Episodes'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.messenger_outlined),
              title: const Text('About'),
              onTap: () {},
            ),
          ],
        ),
      )
          : null,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'FLUTTER WEB. THE BASICS',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'In this course we will go over the basics of using Flutter Web for development. Topics will include Responsive Layout, Deploying, Font Changes, Hover functionality, Modals and more.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Set the background color to green
                ),
                child: const Text(
                  'Join course',
                  style: TextStyle(
                    color: Colors.white
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
