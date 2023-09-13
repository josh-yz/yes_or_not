import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_or_not/config/theme/app_theme.dart';
import 'package:yes_or_not/presentation/providers/chat_provider.dart';
import 'package:yes_or_not/presentation/screens/chat/chat_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        )
      ],
      child: MaterialApp(
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme(selectedColor: 3).theme(),
          home: const ChatScreen()),
    );
  }
}
