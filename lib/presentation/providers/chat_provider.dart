import 'package:flutter/material.dart';
import 'package:yes_or_not/config/helpers/get_yes_no_answer.dart';
import 'package:yes_or_not/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> message = [
    Message(text: 'Hola ', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    message.add(newMessage);

    if (text.trim().endsWith('?')) {
      await herReplay();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReplay() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    message.add(herMessage);
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
