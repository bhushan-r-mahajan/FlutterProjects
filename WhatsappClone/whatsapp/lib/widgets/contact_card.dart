// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_model.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.contact}) : super(key: key);

  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
                backgroundColor: Colors.blueGrey[200],
                radius: 27,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                )),
            contact.selected
                ? Positioned(
                    bottom: 4,
                    right: 5,
                    child: CircleAvatar(
                        radius: 11,
                        child: Icon(
                          Icons.check,
                          size: 13,
                        )),
                  )
                : Container(),
          ],
        ),
      ),
      title: Text(
        contact.name,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        contact.status,
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}
