class ChatModel {
  String name;
  String icon;
  bool isGroup;
  String time;
  String latestMessage;
  String status;
  bool selected;

  ChatModel(
      {required this.name,
      required this.icon,
      required this.isGroup,
      required this.time,
      required this.latestMessage,
      required this.status,
      this.selected = false});

  ChatModel.withStatus(
      {required this.name,
      this.icon = "",
      this.isGroup = false,
      this.time = "",
      this.latestMessage = "",
      required this.status,
      this.selected = false});
}
