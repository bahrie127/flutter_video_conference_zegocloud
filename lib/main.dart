import 'package:flutter/material.dart';
import 'package:flutter_zego_video_conference/video_conference_page.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final userNameController = TextEditingController();
  final conferenceIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meetings App'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(),
            child: TextFormField(
              controller: userNameController,
              maxLength: 50,
              decoration: const InputDecoration(
                labelText: 'UserName',
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                  ),
                ),
                helperText: "Username?",
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(),
            child: TextFormField(
              controller: conferenceIdController,
              maxLength: 50,
              decoration: const InputDecoration(
                labelText: 'Meeting ID',
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                  ),
                ),
                helperText: "Meeting ID?",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return VideoConferencePage(
                  conferenceID: conferenceIdController.text,
                  userName: userNameController.text,
                );
              }));
            },
            child: const Text('Join Meeting'),
          ),
        ],
      ),
    );
  }
}
