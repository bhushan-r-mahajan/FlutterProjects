// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SenderMesaageCard extends StatelessWidget {
  const SenderMesaageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 60, top: 5, bottom: 20),
                child: Text(
                    "Message fshfkhkaljhgkagkljhgkajgnakvnzkvnihiurhiaurgkjnakgnkgj uhaiekhgtarngskngkas><NFOEUIHaeuhytyutrbgjkhbaskgjbnsiguhs78yhtgkngfkashiughqwgh",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Text(
                  "34",
                  style: TextStyle(fontSize: 13),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
