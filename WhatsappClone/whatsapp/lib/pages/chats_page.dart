import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/screens/select_contact_screen.dart';
import 'package:whatsapp/widgets/custom_card.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  List<ChatModel> chats = [
    ChatModel(
        icon: "",
        name: "Abhijit",
        isGroup: false,
        time: "10",
        latestMessage: "hii",
        status: ""),
    ChatModel(
        icon: "",
        name: "Group 1",
        isGroup: true,
        time: "10",
        latestMessage: "hii",
        status: ""),
    ChatModel(
        icon: "",
        name: "Group 2",
        isGroup: true,
        time: "10",
        latestMessage: "hii",
        status: ""),
    ChatModel(
        icon: "",
        name: "Vijay",
        isGroup: false,
        time: "10",
        latestMessage: "hii",
        status: ""),
    ChatModel(
        icon: "",
        name: "Harshal",
        isGroup: false,
        time: "10",
        latestMessage: "hii",
        status: ''),
    ChatModel(
        icon: "",
        name: "Yash",
        isGroup: false,
        time: "10",
        latestMessage: "hii",
        status: ''),
    ChatModel(
        icon: "",
        name: "Abhijit",
        isGroup: false,
        time: "10",
        latestMessage: "hii",
        status: ''),
    ChatModel(
        icon: "",
        name: "Amol",
        isGroup: false,
        time: "10",
        latestMessage: "hii",
        status: ''),
    ChatModel(
        icon: "",
        name: "Rutwik",
        isGroup: false,
        time: "10",
        latestMessage: "hii",
        status: ''),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => SelectContact()));
        },
        child: const Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return Customcard(
            chatModel: chats[index],
          );
        },
      ),
    );
  }
}
