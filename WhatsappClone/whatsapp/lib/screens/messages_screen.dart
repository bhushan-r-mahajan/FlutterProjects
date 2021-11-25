// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as Io;

import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/widgets/attach_file_icons.dart';
import 'package:whatsapp/widgets/emoji_selector.dart';
import 'package:whatsapp/widgets/own_message_card.dart';
import 'package:whatsapp/widgets/sender_message_card.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  bool isEmojiSelected = false;
  FocusNode focusNode = FocusNode();
  late Io.Socket socket;
  TextEditingController _textEditingController = TextEditingController();

  void connect() {
    socket = Io.io("http://localhost:9090", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    print(socket.connected);
    socket.onConnect((data) => print("connected"));
    socket.emit("/test", "Hello World");
  }

  @override
  void initState() {
    super.initState();
    connect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          isEmojiSelected = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image.asset(
        //   "assets/images/whatsappbackground.png",
        //   height: MediaQuery.of(context).size.height,
        //   width: MediaQuery.of(context).size.width,
        // ),
        Scaffold(
          appBar: AppBar(
            leadingWidth: 70,
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back),
                  const SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    child: widget.chatModel.isGroup
                        ? Icon(Icons.group)
                        : Icon(Icons.person),
                  ),
                ],
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chatModel.name,
                  style: TextStyle(fontSize: 19),
                ),
                Text(
                  "Last seen today at 10",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.video_call),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.call),
                onPressed: () {},
              ),
              PopupMenuButton<String>(
                  onSelected: (value) {
                    debugPrint(value);
                  },
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: Text("New Group"),
                        value: "New Group",
                      ),
                      PopupMenuItem(
                        child: Text("New Broadcast"),
                        value: "New Broadcast",
                      ),
                      PopupMenuItem(
                        child: Text("Linked Devices"),
                        value: "Linked Devices",
                      ),
                      PopupMenuItem(
                        child: Text("Stared Messages"),
                        value: "Stared Messages",
                      ),
                      PopupMenuItem(
                        child: Text("Settings"),
                        value: "Settings",
                      ),
                    ];
                  }),
            ],
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              onWillPop: () {
                if (isEmojiSelected) {
                  setState(() {
                    isEmojiSelected = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 140,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return SenderMesaageCard();
                        }),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 55,
                            child: Card(
                                margin: EdgeInsets.only(
                                    left: 4, right: 4, bottom: 8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: TextFormField(
                                  controller: _textEditingController,
                                  focusNode: focusNode,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 10,
                                  minLines: 1,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Message",
                                      contentPadding: EdgeInsets.all(8),
                                      prefixIcon: IconButton(
                                        icon: Icon(Icons.emoji_emotions),
                                        onPressed: () {
                                          focusNode.unfocus();
                                          focusNode.canRequestFocus = false;
                                          setState(() {
                                            isEmojiSelected = !isEmojiSelected;
                                          });
                                        },
                                      ),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.attach_file),
                                            onPressed: () {
                                              showModalBottomSheet(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (builder) =>
                                                      AttachFileIcons());
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.camera_alt),
                                            onPressed: () {},
                                          ),
                                        ],
                                      )),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8, right: 2),
                            child: CircleAvatar(
                              radius: 25,
                              child: IconButton(
                                icon: Icon(Icons.mic),
                                onPressed: () {},
                              ),
                            ),
                          )
                        ]),
                        isEmojiSelected
                            ? EmojiSelector(
                                textEditingController: _textEditingController,
                              )
                            : Container(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
