// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class AttachFileIcons extends StatelessWidget {
  const AttachFileIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  createIcons(
                      Icons.insert_drive_file, "Documents", Colors.deepPurple),
                  SizedBox(
                    width: 30,
                  ),
                  createIcons(Icons.camera_alt, "Camera", Colors.blue),
                  SizedBox(
                    width: 30,
                  ),
                  createIcons(Icons.insert_photo, "Gallery", Colors.indigo),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  createIcons(Icons.headphones, "Audio", Colors.green),
                  SizedBox(
                    width: 30,
                  ),
                  createIcons(
                      Icons.location_pin, "Location", Colors.deepOrange),
                  SizedBox(
                    width: 30,
                  ),
                  createIcons(Icons.person, "Contact", Colors.amber),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget createIcons(
      IconData icon, String text, MaterialColor backgroundColor) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: backgroundColor,
            radius: 30,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
