# 💬 Chat App Flutter - Examen BLOC Pattern

Une application de chat complète développée avec Flutter utilisant le pattern BLOC pour la gestion d'état.

## 🎯 Projet d'Examen

Ce repository contient :
- **Application Flutter** complète avec pattern BLOC
- **Rapport LaTeX** professionnel (35+ pages)
- **Documentation** technique détaillée
- **Code source** commenté et structuré

## 📱 Application Flutter

### Fonctionnalités Implémentées

#### ✅ Écran Liste des Conversations
- Liste des conversations avec avatar, nom, dernier message
- Badge pour les messages non lus avec compteur
- Navigation vers l'écran de conversation détaillée
- Possibilité de créer une nouvelle conversation
- Actualisation des conversations

#### ✅ Écran de Conversation Détaillée
- Messages de la conversation sélectionnée
- Champ de saisie pour envoyer des messages
- Messages différenciés visuellement (utilisateur/contact)
- Défilement automatique vers les nouveaux messages
- Réponses automatiques simulées

### 🏗️ Architecture BLOC

- **États** : Initial, Loading, Loaded, Error
- **Événements** : LoadConversations, SendMessage, ReceiveMessage, CreateConversation
- **Gestion d'état immutable** avec Equatable
- **Séparation claire** entre UI et logique métier

### 📊 Modèles de Données

```dart
class Conversation extends Equatable {
  final String id;
  final String contactName;
  final String lastMessage;
  final DateTime timestamp;
  final int unreadCount;
}

class Message extends Equatable {
  final String id;
  final String conversationId;
  final String content;
  final bool isMe;
  final DateTime timestamp;
}
```

## 🚀 Installation et Exécution

### Prérequis
- Flutter SDK (3.0+)
- Dart SDK
- Android Studio / VS Code
- Émulateur Android ou device physique

### Étapes d'installation

1. **Cloner le repository**
   ```bash
   git clone https://github.com/oussamabartil/Chat_app_flutter.git
   cd Chat_app_flutter
   ```

2. **Installer les dépendances**
   ```bash
   cd chat_app
   flutter pub get
   ```

3. **Lancer l'application**
   ```bash
   flutter run
   ```

### Dépendances Principales
- `flutter_bloc: ^9.1.1` - Gestion d'état BLOC
- `equatable: ^2.0.7` - États immutables

## 📁 Structure du Projet

```
├── chat_app/                    # Application Flutter
│   ├── lib/
│   │   ├── blocs/              # BLOC (États, Événements, Logique)
│   │   ├── models/             # Modèles de données
│   │   ├── screens/            # Écrans de l'application
│   │   ├── widgets/            # Widgets réutilisables
│   │   ├── data/               # Données mock
│   │   └── main.dart           # Point d'entrée
│   ├── test/                   # Tests unitaires
│   └── pubspec.yaml            # Dépendances Flutter
├── rapport/                    # Rapport LaTeX
│   ├── rapport_flutter_chat.tex # Rapport principal
│   ├── images/                 # Captures d'écran
│   ├── diagrams/               # Diagrammes TikZ
│   └── scripts/                # Scripts de compilation
└── README.md                   # Ce fichier
```

## 📋 Rapport LaTeX

Le dossier `rapport/` contient un rapport technique complet incluant :

### Contenu du Rapport
- **Architecture BLOC** avec diagrammes
- **Code source complet** avec explications
- **Captures d'écran** de l'interface
- **Analyse technique** détaillée
- **Tests et validation**

### Compilation du Rapport
```bash
cd rapport
python generate_mockups.py    # Générer les images
./compile_rapport.sh          # Compiler (Unix/Linux)
# ou
compile_rapport.bat           # Compiler (Windows)
```

## 🧪 Tests

Lancer les tests unitaires :
```bash
cd chat_app
flutter test
```

## 📱 Captures d'Écran

### Liste des Conversations
- Affichage des conversations avec avatars
- Badges de messages non lus
- Interface Material Design moderne

### Conversation Détaillée
- Bulles de messages différenciées
- Champ de saisie intuitif
- Réponses automatiques

## 🎨 Fonctionnalités Avancées

- **Réponses automatiques** simulées
- **Gestion des messages non lus** avec badges
- **Formatage intelligent** des timestamps
- **Navigation fluide** entre écrans
- **Interface responsive** et moderne

## 🔧 Technologies Utilisées

- **Flutter** - Framework de développement mobile
- **Dart** - Langage de programmation
- **BLOC Pattern** - Gestion d'état
- **Equatable** - États immutables
- **Material Design 3** - Interface utilisateur
- **LaTeX** - Documentation technique

## 👨‍💻 Auteur

**Oussama Bartil**
- GitHub: [@oussamabartil](https://github.com/oussamabartil)
- Projet d'examen Flutter - Pattern BLOC

## 📄 Licence

Ce projet est développé dans le cadre d'un examen académique.

## 🚀 Améliorations Futures

- Persistance des données avec base de données locale
- Authentification utilisateur
- Messages en temps réel avec WebSocket
- Envoi de médias (images, fichiers)
- Notifications push
- Recherche dans les conversations

---

**Note :** Ce projet démontre une maîtrise complète du pattern BLOC avec Flutter, incluant une architecture claire, des tests unitaires, et une documentation technique professionnelle.
