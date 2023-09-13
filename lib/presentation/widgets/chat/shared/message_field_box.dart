import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  MessageFieldBox({Key? key, required this.onValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      controller: textController,
      focusNode: focusNode,
      decoration: InputDecoration(
          hintText: 'End your message with a "?"',
          enabledBorder: outlineInputBorder,
          filled: true,
          suffixIcon: IconButton(
            icon: const Icon(Icons.send_outlined),
            onPressed: () {
              final textValue = textController.value.text;
              textController.clear();
              onValue(textValue);
            },
          )),
      onFieldSubmitted: (value) {
        print('Submit value $value');
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
