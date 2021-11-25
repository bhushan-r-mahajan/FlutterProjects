// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/widgets/avatar_card.dart';
import 'package:whatsapp/widgets/contact_card.dart';

class CreateGroup extends StatefulWidget {
  CreateGroup({Key? key}) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel.withStatus(name: "Vijay", status: "Calls"),
    ChatModel.withStatus(name: "Abhijit", status: "Calls"),
    ChatModel.withStatus(name: "Harshal", status: "Calls"),
    ChatModel.withStatus(name: "Yash", status: "Calls"),
    ChatModel.withStatus(name: "Rutwik", status: "Calls"),
    ChatModel.withStatus(name: "Jay", status: "Calls"),
    ChatModel.withStatus(name: "Amol", status: "Calls"),
    ChatModel.withStatus(name: "Bhushan", status: "Calls"),
  ];

  List<ChatModel> selectedContacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Group",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Add Participants",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: contacts.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  height: selectedContacts.length > 0 ? 90 : 0,
                );
              }
              return InkWell(
                onTap: () {
                  if (contacts[index - 1].selected == false) {
                    setState(() {
                      contacts[index - 1].selected = true;
                      selectedContacts.add(contacts[index - 1]);
                    });
                  } else {
                    setState(() {
                      contacts[index - 1].selected = false;
                      selectedContacts.remove(contacts[index - 1]);
                    });
                  }
                },
                child: ContactCard(
                  contact: contacts[index - 1],
                ),
              );
            },
          ),
          selectedContacts.length > 0
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      color: Colors.white,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            if (contacts[index].selected == true) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedContacts.remove(contacts[index]);
                                    contacts[index].selected = false;
                                  });
                                },
                                child: AvatarCard(
                                  contact: contacts[index],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
                    Divider(
                      thickness: 1,
                    )
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
