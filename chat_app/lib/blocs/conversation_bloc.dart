import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/conversation.dart';
import '../models/message.dart';
import '../data/mock_data.dart';
import 'conversation_event.dart';
import 'conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  ConversationBloc() : super(ConversationInitial()) {
    on<LoadConversations>(_onLoadConversations);
    on<SendMessage>(_onSendMessage);
    on<ReceiveMessage>(_onReceiveMessage);
    on<CreateConversation>(_onCreateConversation);
    on<LoadMessages>(_onLoadMessages);
  }

  void _onLoadConversations(
    LoadConversations event,
    Emitter<ConversationState> emit,
  ) async {
    emit(ConversationLoading());
    
    try {
      // Simuler un délai de chargement
      await Future.delayed(const Duration(milliseconds: 500));
      
      final conversations = MockData.mockConversations;
      final messages = MockData.mockMessages;
      
      emit(ConversationLoaded(
        conversations: conversations,
        messages: messages,
      ));
    } catch (e) {
      emit(ConversationError(message: 'Erreur lors du chargement des conversations'));
    }
  }

  void _onSendMessage(
    SendMessage event,
    Emitter<ConversationState> emit,
  ) async {
    if (state is ConversationLoaded) {
      final currentState = state as ConversationLoaded;
      
      // Créer le nouveau message
      final newMessage = Message(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        conversationId: event.conversationId,
        content: event.content,
        isMe: true,
        timestamp: DateTime.now(),
      );
      
      // Mettre à jour les messages
      final updatedMessages = Map<String, List<Message>>.from(currentState.messages);
      final conversationMessages = List<Message>.from(
        updatedMessages[event.conversationId] ?? []
      );
      conversationMessages.add(newMessage);
      updatedMessages[event.conversationId] = conversationMessages;
      
      // Mettre à jour la conversation avec le dernier message
      final updatedConversations = currentState.conversations.map((conv) {
        if (conv.id == event.conversationId) {
          return conv.copyWith(
            lastMessage: event.content,
            timestamp: DateTime.now(),
          );
        }
        return conv;
      }).toList();
      
      emit(currentState.copyWith(
        conversations: updatedConversations,
        messages: updatedMessages,
      ));
      
      // Simuler une réponse automatique après 2 secondes
      await Future.delayed(const Duration(seconds: 2));
      add(ReceiveMessage(
        conversationId: event.conversationId,
        content: _getAutoReply(event.content),
      ));
    }
  }

  void _onReceiveMessage(
    ReceiveMessage event,
    Emitter<ConversationState> emit,
  ) {
    if (state is ConversationLoaded) {
      final currentState = state as ConversationLoaded;
      
      // Créer le nouveau message reçu
      final newMessage = Message(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        conversationId: event.conversationId,
        content: event.content,
        isMe: false,
        timestamp: DateTime.now(),
      );
      
      // Mettre à jour les messages
      final updatedMessages = Map<String, List<Message>>.from(currentState.messages);
      final conversationMessages = List<Message>.from(
        updatedMessages[event.conversationId] ?? []
      );
      conversationMessages.add(newMessage);
      updatedMessages[event.conversationId] = conversationMessages;
      
      // Mettre à jour la conversation avec le dernier message et incrémenter les non lus
      final updatedConversations = currentState.conversations.map((conv) {
        if (conv.id == event.conversationId) {
          return conv.copyWith(
            lastMessage: event.content,
            timestamp: DateTime.now(),
            unreadCount: conv.unreadCount + 1,
          );
        }
        return conv;
      }).toList();
      
      emit(currentState.copyWith(
        conversations: updatedConversations,
        messages: updatedMessages,
      ));
    }
  }

  void _onCreateConversation(
    CreateConversation event,
    Emitter<ConversationState> emit,
  ) {
    if (state is ConversationLoaded) {
      final currentState = state as ConversationLoaded;
      
      final newConversation = Conversation(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        contactName: event.contactName,
        lastMessage: 'Nouvelle conversation',
        timestamp: DateTime.now(),
        unreadCount: 0,
      );
      
      final updatedConversations = [newConversation, ...currentState.conversations];
      final updatedMessages = Map<String, List<Message>>.from(currentState.messages);
      updatedMessages[newConversation.id] = [];
      
      emit(currentState.copyWith(
        conversations: updatedConversations,
        messages: updatedMessages,
      ));
    }
  }

  void _onLoadMessages(
    LoadMessages event,
    Emitter<ConversationState> emit,
  ) {
    if (state is ConversationLoaded) {
      final currentState = state as ConversationLoaded;
      
      // Marquer les messages comme lus
      final updatedConversations = currentState.conversations.map((conv) {
        if (conv.id == event.conversationId) {
          return conv.copyWith(unreadCount: 0);
        }
        return conv;
      }).toList();
      
      emit(currentState.copyWith(conversations: updatedConversations));
    }
  }

  String _getAutoReply(String message) {
    final replies = [
      'Intéressant !',
      'Je vois...',
      'D\'accord !',
      'Merci pour l\'info',
      'C\'est noté !',
      'Parfait !',
      'Bonne idée !',
    ];
    
    return replies[DateTime.now().millisecond % replies.length];
  }
}
