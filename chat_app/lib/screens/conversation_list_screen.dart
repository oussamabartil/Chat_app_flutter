import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/conversation_bloc.dart';
import '../blocs/conversation_event.dart';
import '../blocs/conversation_state.dart';
import '../models/conversation.dart';
import '../widgets/conversation_tile.dart';
import 'conversation_detail_screen.dart';

class ConversationListScreen extends StatelessWidget {
  const ConversationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<ConversationBloc>().add(LoadConversations());
            },
          ),
        ],
      ),
      body: BlocBuilder<ConversationBloc, ConversationState>(
        builder: (context, state) {
          if (state is ConversationLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          
          if (state is ConversationError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.message,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ConversationBloc>().add(LoadConversations());
                    },
                    child: const Text('Réessayer'),
                  ),
                ],
              ),
            );
          }
          
          if (state is ConversationLoaded) {
            final conversations = state.conversations;
            
            if (conversations.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat_bubble_outline,
                      size: 64,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Aucune conversation',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            }
            
            return ListView.builder(
              itemCount: conversations.length,
              itemBuilder: (context, index) {
                final conversation = conversations[index];
                return ConversationTile(
                  conversation: conversation,
                  onTap: () => _navigateToConversationDetail(context, conversation),
                );
              },
            );
          }
          
          return const Center(
            child: Text('État inconnu'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateConversationDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _navigateToConversationDetail(BuildContext context, Conversation conversation) {
    // Marquer les messages comme lus
    context.read<ConversationBloc>().add(LoadMessages(conversationId: conversation.id));
    
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ConversationDetailScreen(conversation: conversation),
      ),
    );
  }

  void _showCreateConversationDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Nouvelle conversation'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'Nom du contact',
              hintText: 'Entrez le nom du contact',
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                if (controller.text.trim().isNotEmpty) {
                  context.read<ConversationBloc>().add(
                    CreateConversation(contactName: controller.text.trim()),
                  );
                  Navigator.of(dialogContext).pop();
                }
              },
              child: const Text('Créer'),
            ),
          ],
        );
      },
    );
  }
}
