# Application de Chat Flutter

Une application de chat développée avec Flutter utilisant le pattern BLOC pour la gestion d'état.

## Fonctionnalités

### ✅ Écran Liste des conversations
- Liste des conversations avec avatar, nom, dernier message
- Badge pour les messages non lus
- Navigation vers l'écran de conversation détaillée
- Possibilité de créer une nouvelle conversation
- Actualisation des conversations

### ✅ Écran de conversation détaillée
- Messages de la conversation sélectionnée
- Champ de saisie pour envoyer des messages
- Messages différenciés visuellement (utilisateur/contact)
- Défilement automatique vers les nouveaux messages
- Réponses automatiques simulées

## Architecture BLOC

### États (States)
- `ConversationInitial` : État initial
- `ConversationLoading` : Chargement en cours
- `ConversationLoaded` : Données chargées avec conversations et messages
- `ConversationError` : Erreur avec message d'erreur

### Événements (Events)
- `LoadConversations` : Charger les conversations
- `SendMessage` : Envoyer un message
- `ReceiveMessage` : Recevoir un message
- `CreateConversation` : Créer une nouvelle conversation
- `LoadMessages` : Charger les messages d'une conversation

### BLOC Principal
- `ConversationBloc` : Gère tous les états et événements
- Utilise des données mock pour la simulation
- Implémente des réponses automatiques
- Gestion des messages non lus

## Modèles de Données

### Conversation
```dart
class Conversation {
  final String id;
  final String contactName;
  final String lastMessage;
  final DateTime timestamp;
  final int unreadCount;
}
```

### Message
```dart
class Message {
  final String id;
  final String conversationId;
  final String content;
  final bool isMe;
  final DateTime timestamp;
}
```

## Navigation

L'application utilise la navigation Flutter standard :
- `ConversationListScreen` → `ConversationDetailScreen`
- Navigation avec `Navigator.push()` et retour automatique
- Passage de données via les constructeurs

## Fonctionnalités Implémentées

1. **Gestion d'état immutable** avec Equatable
2. **Données mock** simulant des conversations réelles
3. **Interface utilisateur moderne** avec Material Design 3
4. **Réponses automatiques** pour simuler une conversation
5. **Badges de messages non lus** avec compteur
6. **Formatage intelligent des timestamps**
7. **Bulles de messages** différenciées par utilisateur
8. **Création de nouvelles conversations**
9. **Défilement automatique** vers les nouveaux messages

## Structure du Projet

```
lib/
├── blocs/
│   ├── conversation_bloc.dart
│   ├── conversation_event.dart
│   └── conversation_state.dart
├── data/
│   └── mock_data.dart
├── models/
│   ├── conversation.dart
│   └── message.dart
├── screens/
│   ├── conversation_list_screen.dart
│   └── conversation_detail_screen.dart
├── widgets/
│   ├── conversation_tile.dart
│   └── message_bubble.dart
└── main.dart
```

## Dépendances

- `flutter_bloc: ^9.1.1` - Gestion d'état BLOC
- `equatable: ^2.0.7` - États immutables

## Installation et Exécution

1. Cloner le repository
2. Installer les dépendances : `flutter pub get`
3. Lancer l'application : `flutter run`

## Tests

Pour tester l'application :
1. Lancer l'application
2. Naviguer dans la liste des conversations
3. Ouvrir une conversation pour voir les messages
4. Envoyer des messages et observer les réponses automatiques
5. Créer une nouvelle conversation
6. Observer les badges de messages non lus

## Améliorations Futures

- Persistance des données
- Authentification utilisateur
- Messages en temps réel
- Envoi de médias
- Notifications push
- Recherche dans les conversations
