import 'package:chat_app/models/user_models.dart';

class Message {
  final User sender;
  final String date;
  final String text;
  final bool isLiked;
  final bool unread;

  Message(
      {required this.sender,
      required this.date,
      required this.text,
      required this.isLiked,
      required this.unread});
}

//current user
final User currentUser =
    User(id: 0, name: "Luffy", imageURL: "assets/images/luffy.jpg");

//Other users

final User zoro =
    User(id: 2, name: "Zoro", imageURL: "assets/images/zoro.jpeg");
final User ussop =
    User(id: 3, name: "Ussop", imageURL: "assets/images/ussop.jpg");
final User sanji =
    User(id: 4, name: "Sanji", imageURL: "assets/images/sanji.jpg");
final User nami = User(id: 5, name: "Nami", imageURL: "assets/images/nami.jpg");
final User chopper =
    User(id: 6, name: "Chopper", imageURL: "assets/images/chopper.png");
final User robin =
    User(id: 7, name: "Robin", imageURL: "assets/images/robin.jpeg");
final User brook =
    User(id: 8, name: "Brook", imageURL: "assets/images/brook.jpg");
final User jimbei =
    User(id: 9, name: "Jimbei", imageURL: "assets/images/jimbei.jpg");
final User franky =
    User(id: 9, name: "Franky", imageURL: "assets/images/franky.jpg");

//Favorite contacts list
List<User> favorites = [zoro, sanji, chopper, nami, franky, jimbei];

//Chats
List<Message> chats = [
  Message(
      sender: zoro, date: '5:30 PM', text: "Hi", isLiked: false, unread: true),
  Message(
      sender: sanji, date: '5:30 PM', text: "Hi", isLiked: false, unread: true),
  Message(
      sender: chopper,
      date: '5:30 PM',
      text: "Hi",
      isLiked: false,
      unread: false),
];

//Example in chat screen
List<Message> messages = [
  Message(
      sender: zoro, date: '5:30 PM', text: "Hi", isLiked: false, unread: true),
  Message(
      sender: currentUser,
      date: '5:30 PM',
      text: "Hi",
      isLiked: false,
      unread: true),
  Message(
      sender: zoro,
      date: '5:30 PM',
      text: "Hows it going man?",
      isLiked: true,
      unread: true),
  Message(
      sender: currentUser,
      date: '5:30 PM',
      text: "Good, are you lost?",
      isLiked: false,
      unread: true),
];
