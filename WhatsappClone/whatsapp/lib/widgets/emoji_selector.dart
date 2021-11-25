import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class EmojiSelector extends StatefulWidget {
  const EmojiSelector({Key? key, required this.textEditingController})
      : super(key: key);
  final TextEditingController textEditingController;
  @override
  _EmojiSelectorState createState() => _EmojiSelectorState();
}

class _EmojiSelectorState extends State<EmojiSelector> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: EmojiPicker(
        onEmojiSelected: (category, emoji) {
          widget.textEditingController.text =
              widget.textEditingController.text + emoji.emoji;
        },
        onBackspacePressed: () {
          widget.textEditingController.text = widget
              .textEditingController.text.characters
              .skipLast(1)
              .toString();
        },
        config: Config(
          columns: 7,
          verticalSpacing: 0,
          horizontalSpacing: 0,
          initCategory: Category.RECENT,
          indicatorColor: Theme.of(context).primaryColor,
          iconColorSelected: Colors.blue,
          progressIndicatorColor: Colors.blue,
          backspaceColor: Colors.blue,
        ),
      ),
    );
  }
}
