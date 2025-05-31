# Compte Rendu d'Examen Flutter - Application de Chat

**Nom :** [Votre Nom]  
**Prénom :** [Votre Prénom]  
**Date :** [Date de l'examen]

## Introduction

Ce document présente le développement d'une application de chat Flutter utilisant le pattern BLOC pour la gestion d'état. L'application implémente toutes les fonctionnalités demandées avec une architecture claire et maintenable.

## Architecture BLOC Utilisée

### 1. États (States)

L'application utilise quatre états principaux héritant de `ConversationState` :

#### `ConversationInitial`
- État initial de l'application
- Affiché au démarrage avant le chargement des données

#### `ConversationLoading`
- État de chargement
- Affiche un indicateur de progression circulaire
- Utilisé pendant la récupération des données mock

#### `ConversationLoaded`
- État principal contenant les données
- Propriétés :
  - `List<Conversation> conversations` : Liste des conversations
  - `Map<String, List<Message>> messages` : Messages indexés par ID de conversation
- Utilise `copyWith()` pour les mises à jour immutables

#### `ConversationError`
- État d'erreur avec message descriptif
- Affiche une interface d'erreur avec possibilité de réessayer

### 2. Événements (Events)

Cinq événements principaux héritant de `ConversationEvent` :

#### `LoadConversations`
- Déclenche le chargement initial des conversations
- Appelé au démarrage de l'application

#### `SendMessage`
- Paramètres : `conversationId`, `content`
- Ajoute un message de l'utilisateur
- Déclenche une réponse automatique après 2 secondes

#### `ReceiveMessage`
- Paramètres : `conversationId`, `content`
- Simule la réception d'un message
- Incrémente le compteur de messages non lus

#### `CreateConversation`
- Paramètre : `contactName`
- Crée une nouvelle conversation vide

#### `LoadMessages`
- Paramètre : `conversationId`
- Marque les messages comme lus (remet le compteur à 0)

### 3. BLOC Principal

Le `ConversationBloc` gère la logique métier :

- **Gestion des états immutables** avec Equatable
- **Simulation de données** avec délais réalistes
- **Réponses automatiques** aléatoires
- **Gestion des messages non lus**
- **Mise à jour des timestamps** en temps réel

## Navigation Entre les Écrans

### Structure de Navigation

```
ConversationListScreen (Écran principal)
    ↓ (Tap sur une conversation)
ConversationDetailScreen (Écran de détail)
    ↓ (Bouton retour)
ConversationListScreen
```

### Implémentation

1. **Navigation vers le détail** :
   ```dart
   Navigator.of(context).push(
     MaterialPageRoute(
       builder: (context) => ConversationDetailScreen(conversation: conversation),
     ),
   );
   ```

2. **Passage de données** :
   - L'objet `Conversation` est passé via le constructeur
   - Les messages sont récupérés via le BLOC partagé

3. **Retour automatique** :
   - Utilisation du bouton retour natif d'Android/iOS
   - Pas de gestion spéciale nécessaire

## Fonctionnalités Implémentées

### 1. Écran Liste des Conversations

#### Interface Utilisateur
- **AppBar** avec titre "Messages" et bouton d'actualisation
- **ListView.builder** pour l'affichage optimisé des conversations
- **FloatingActionButton** pour créer une nouvelle conversation

#### Fonctionnalités
- ✅ **Liste des conversations** avec avatar généré automatiquement
- ✅ **Nom du contact** affiché en gras si messages non lus
- ✅ **Dernier message** avec ellipsis si trop long
- ✅ **Badge de messages non lus** avec compteur (max 99+)
- ✅ **Formatage intelligent des timestamps** (maintenant, Xmin, Xh, hier, X jours)
- ✅ **Navigation vers le détail** au tap
- ✅ **Création de nouvelles conversations** via dialog

#### Gestion des États
- Affichage du loading pendant le chargement
- Gestion des erreurs avec possibilité de réessayer
- État vide avec message informatif

### 2. Écran de Conversation Détaillée

#### Interface Utilisateur
- **AppBar** avec avatar et nom du contact
- **Zone de messages** avec défilement automatique
- **Champ de saisie** avec bouton d'envoi

#### Fonctionnalités
- ✅ **Messages différenciés visuellement** :
  - Messages utilisateur : bulles bleues alignées à droite
  - Messages contact : bulles grises alignées à gauche
- ✅ **Avatars** pour chaque type de message
- ✅ **Timestamps** formatés pour chaque message
- ✅ **Champ de saisie** avec validation
- ✅ **Envoi par bouton** ou touche Entrée
- ✅ **Défilement automatique** vers les nouveaux messages
- ✅ **Réponses automatiques** simulées

#### Gestion des Messages
- Marquage automatique comme lu à l'ouverture
- Mise à jour en temps réel via BlocBuilder
- Gestion des conversations vides

### 3. Fonctionnalités Avancées

#### Simulation Réaliste
- **Délais de chargement** (500ms)
- **Réponses automatiques** après 2 secondes
- **Données mock** cohérentes et réalistes

#### Interface Moderne
- **Material Design 3** avec thème cohérent
- **Animations** de navigation fluides
- **Responsive design** adaptatif

## Modèles de Données

### Conversation
```dart
class Conversation extends Equatable {
  final String id;
  final String contactName;
  final String lastMessage;
  final DateTime timestamp;
  final int unreadCount;
}
```

### Message
```dart
class Message extends Equatable {
  final String id;
  final String conversationId;
  final String content;
  final bool isMe;
  final DateTime timestamp;
}
```

## Gestion d'État avec BLOC

### Avantages de l'Architecture Choisie

1. **Séparation des responsabilités** : UI, logique métier, et données séparées
2. **États immutables** : Prévention des bugs liés aux mutations
3. **Testabilité** : Logique métier isolée et facilement testable
4. **Réactivité** : Interface mise à jour automatiquement
5. **Scalabilité** : Architecture extensible pour de nouvelles fonctionnalités

### Utilisation d'Equatable

- **États immutables** garantis
- **Comparaisons optimisées** pour les rebuilds
- **Debugging facilité** avec props

## Conclusion

L'application de chat développée respecte toutes les exigences de l'examen :

- ✅ **Architecture BLOC** complète et bien structurée
- ✅ **Navigation** fluide entre les écrans
- ✅ **Fonctionnalités** toutes implémentées et fonctionnelles
- ✅ **Interface utilisateur** moderne et intuitive
- ✅ **Gestion d'état** immutable avec Equatable
- ✅ **Données mock** réalistes pour la démonstration

L'architecture choisie permet une maintenance facile et l'ajout de nouvelles fonctionnalités. Le code est bien organisé, documenté et suit les bonnes pratiques Flutter et BLOC.
