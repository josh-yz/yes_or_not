import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_or_not/domain/entities/message.dart';
import 'package:yes_or_not/presentation/providers/chat_provider.dart';
import 'package:yes_or_not/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_or_not/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_or_not/presentation/widgets/chat/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(9.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://www.eluniversal.com.mx/resizer/8mXkDVOkYvLqeCkqVQERtReIjwc=/1100x666/filters:focal(661x339:671x349)/cloudfront-us-east-1.images.arcpublishing.com/eluniversal/6NC45C3PARBAXM73AJWFNC6IGA.jpg'),
          ),
        ),
        title: const Text('Mi amor 😘'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.message.length,
              itemBuilder: (context, index) {
                final message = chatProvider.message[index];

                return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(message: message)
                    : MyMessageBubble(message: message);
              },
            )),
            MessageFieldBox(onValue: (value) => chatProvider.sendMessage(value))
          ],
        ),
      ),
    );
  }
}
