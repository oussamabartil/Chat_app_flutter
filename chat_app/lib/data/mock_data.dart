import '../models/conversation.dart';
import '../models/message.dart';

class MockData {
  static List<Conversation> get mockConversations => [
    Conversation(
      id: '1',
      contactName: 'Oussama BARTIL',
      lastMessage: 'Salut ! Comment ça va ?',
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      unreadCount: 2,
    ),
    Conversation(
      id: '2',
      contactName: 'BARTIL HASSAN',
      lastMessage: 'On se voit demain ?',
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      unreadCount: 0,
    ),
    Conversation(
      id: '3',
      contactName: 'BARTIL3',
      lastMessage: 'Merci pour ton aide !',
      timestamp: DateTime.now().subtract(const Duration(hours: 3)),
      unreadCount: 1,
    ),
    Conversation(
      id: '4',
      contactName: 'BARTIL4',
      lastMessage: 'À bientôt !',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      unreadCount: 0,
    ),
    Conversation(
      id: '5',
      contactName: 'BArtil 5',
      lastMessage: 'Super idée !',
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
      unreadCount: 3,
    ),
  ];

  static Map<String, List<Message>> get mockMessages => {
    '1': [
      Message(
        id: '1',
        conversationId: '1',
        content: 'Salut Oussama ! Ça va très bien et toi ?',
        isMe: true,
        timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
      ),
      Message(
        id: '2',
        conversationId: '1',
        content: 'Ça va super ! Tu fais quoi ce weekend ?',
        isMe: false,
        timestamp: DateTime.now().subtract(const Duration(minutes: 8)),
      ),
      Message(
        id: '3',
        conversationId: '1',
        content: 'Je pensais aller au cinéma, ça te dit ?',
        isMe: true,
        timestamp: DateTime.now().subtract(const Duration(minutes: 7)),
      ),
      Message(
        id: '4',
        conversationId: '1',
        content: 'Salut ! Comment ça va ?',
        isMe: false,
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
    ],
    '2': [
      Message(
        id: '5',
        conversationId: '2',
        content: 'Salut bartil !',
        isMe: true,
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      Message(
        id: '6',
        conversationId: '2',
        content: 'On se voit demain ?',
        isMe: false,
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      ),
    ],
    '3': [
      Message(
        id: '7',
        conversationId: '3',
        content: 'De rien Claire, c\'était avec plaisir !',
        isMe: true,
        timestamp: DateTime.now().subtract(const Duration(hours: 4)),
      ),
      Message(
        id: '8',
        conversationId: '3',
        content: 'Merci pour ton aide !',
        isMe: false,
        timestamp: DateTime.now().subtract(const Duration(hours: 3)),
      ),
    ],
    '4': [
      Message(
        id: '9',
        conversationId: '4',
        content: 'À bientôt BARTIL4 !',
        isMe: true,
        timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 1)),
      ),
      Message(
        id: '10',
        conversationId: '4',
        content: 'À bientôt !',
        isMe: false,
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ],
    '5': [
      Message(
        id: '11',
        conversationId: '5',
        content: 'J\'ai une idée pour le projet !',
        isMe: true,
        timestamp: DateTime.now().subtract(const Duration(days: 2, hours: 1)),
      ),
      Message(
        id: '12',
        conversationId: '5',
        content: 'Super idée !',
        isMe: false,
        timestamp: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ],
  };
}
