import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/conversation_list_screen.dart';
import 'blocs/conversation_bloc.dart';
import 'blocs/conversation_event.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConversationBloc()..add(LoadConversations()),
      child: MaterialApp(
        title: 'Chat App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const ConversationListScreen(),
      ),
    );
  }
}
