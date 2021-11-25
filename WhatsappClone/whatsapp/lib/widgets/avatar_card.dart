// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_model.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({Key? key, required this.contact}) : super(key: key);

  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
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
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                          radius: 11,
                          backgroundColor: Colors.grey,
                          child: Icon(
                            Icons.clear,
                            size: 13,
                            color: Colors.white,
                          )),
                    )
                  : Container(),
            ],
          ),
          Text(contact.name)
        ],
      ),
    );
  }
}
