import 'package:chat_ui/chat_history.dart';
import 'package:chat_ui/chat_ui.dart';
import 'package:chat_ui/model/chat_history_options.dart';
import 'package:chat_ui/model/room_data.dart';
import 'package:example/stub.dart';
import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
        title: Text(widget.title),
      ),
      body: ChatUi(
        roomData: RoomData(
          roomName: "test_room",
          myName: "test user"
        ),
        Stub.getChatHistoryModels(),
        futureSendProcess: (chatHistoryModel, chatHistoryModels) {
          chatHistoryModels.add(chatHistoryModel);
          return Future.value(chatHistoryModels);
        },
        leftHistoryOptions: const ChatHistoryOptions(
            namePosition: NamePosition.bottom,
        ),
        rightHistoryOptions: const ChatHistoryOptions(
            namePosition: NamePosition.bottom,
        ),
      ),
    );
  }
}
