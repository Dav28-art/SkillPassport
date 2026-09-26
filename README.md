# 🪪 SkillPassport Africa

Plateforme IA de passeport de compétences numériques et de matching d'opportunités pour la jeunesse africaine.

## 🎯 Objectif du MVP

Notre application doit permettre de suivre ce parcours de bout en bout :

```
Inscription → Profil → Skill Passport → Analyse IA → Skill Gap → Opportunités → Matching
```

L'objectif est d'avoir un **prototype fonctionnel et démontrable**, pas de développer toutes les fonctionnalités possibles.

### Scénario de démonstration final

```
👤 Un jeune crée son compte
        ↓
📝 Il complète son profil
        ↓
🪪 Il construit son Skill Passport
        ↓
🤖 L'IA analyse son profil
        ↓
📊 Elle détecte son Skill Gap
        ↓
📚 Elle recommande des compétences à développer
        ↓
💼 Elle trouve des opportunités
        ↓
🎯 Elle calcule le Matching
        ↓
📈 "91% compatible"
```

## 🛠️ Stack technique

- **Frontend** : Flutter
- **Backend** : Firebase (Authentication, Firestore, Storage)
- **Projet Firebase** : `skillpassport-africa`

## 🚀 Setup — Cloner et démarrer

### 1. Cloner le dépôt

```bash
git clone https://github.com/Dav28-art/skillpassport-africa.git
cd skillpassport-africa
git checkout develop
```

### 2. Récupérer les dépendances Flutter

```bash
flutter pub get
```

### 3. Installer Firebase CLI + FlutterFire CLI (si pas déjà fait)

```bash
npm install -g firebase-tools
firebase login
dart pub global activate flutterfire_cli
```

⚠️ Si `flutterfire` n'est pas reconnu après installation, ajoute `$HOME/.pub-cache/bin` à ton PATH (dans `.bashrc` / `.zshrc`) :

```bash
export PATH="$PATH":"$HOME/.pub-cache/bin"
```

### 4. Se connecter au projet Firebase

Chacun doit générer sa propre configuration locale (le fichier `firebase_options.dart` n'est **pas** sur GitHub, c'est normal — il est dans `.gitignore`) :

```bash
flutterfire configure
```

- Sélectionne le projet **skillpassport-africa**
- Coche uniquement **Android** et **Web** (pas iOS/macOS/Windows)

### 5. Lancer l'application

```bash
flutter run
```

Choisis un appareil Android (émulateur ou téléphone en mode développeur) — évite de lancer sur "Linux/Desktop", Firebase n'est pas configuré pour cette plateforme.

⚠️ **Important** : ne jamais commiter `google-services.json`, `GoogleService-Info.plist` ou `firebase_options.dart` — ce sont des fichiers de config locale, chacun génère la sienne.

## 👥 Répartition des tâches

### 1. David — Lead / Architecture (`feature/dashboard`)

- Superviser l'architecture du projet Flutter
- Maintenir la cohérence entre les modules
- Gérer GitHub et les Pull Requests
- Intégrer les fonctionnalités des autres membres
- Développer le **Dashboard** principal et la navigation globale
- Vérifier que tous les modules communiquent correctement

**À développer** : message de bienvenue, résumé du profil, niveau/progression des compétences, objectif professionnel, Skill Gap résumé, opportunités recommandées, accès rapide au Skill Passport.

**Livrable** : Dashboard fonctionnel + navigation principale + intégration des modules.

### 2. Frontend / UI (`feature/ui`)

Développer les interfaces Flutter à partir du design défini.

**Écrans à réaliser** :
- Authentification (Login, Register)
- Profil (affichage, modification)
- Skill Passport (compétences, niveau, projets, expériences, formations, GitHub/Portfolio)
- Opportunités (liste, détail, bouton postuler)

Focus : UI, widgets, navigation, responsive design. Ne pas modifier la logique Firebase ou IA sans coordination.

**Livrable** : tous les écrans principaux fonctionnels avec navigation entre eux et données temporaires si le backend n'est pas encore prêt.

### 3. Firebase / Backend (`feature/firebase`)

Mettre en place toute la couche Firebase.

- **Authentication** : Register, Login, Logout, Current User
- **Firestore** : collections `users`, `projects`, `opportunities`, `skillGaps`, `matches`, `applications`
- **Modèles** : UserModel, SkillModel, ProjectModel, OpportunityModel, MatchModel
- **Storage** : upload photo de profil, CV, éventuellement images de projets
- **Sécurité** : règles Firestore (un utilisateur peut modifier son propre profil, pas celui des autres ; données sensibles protégées)

**Livrable** : Auth + Firestore + Storage fonctionnels et services Flutter prêts à être utilisés par le frontend et l'IA.

### 4. IA / Matching (`feature/ai`)

Fonctionnalité centrale du projet — transformer le profil d'un utilisateur en recommandations intelligentes.

- **Analyse du profil** : déterminer les compétences pertinentes à partir du profil, compétences, projets, expériences, objectif professionnel
- **Skill Gap** : identifier les compétences manquantes par rapport à l'objectif, et proposer des pistes d'apprentissage
- **Matching** : comparer le profil aux compétences requises d'une opportunité → score de compatibilité

Le résultat doit être **structuré** (JSON), pas un gros texte libre. Exemple :

```json
{
  "targetRole": "Full Stack Developer",
  "missingSkills": ["Node.js", "PostgreSQL", "Docker"],
  "recommendations": [
    "Learn Node.js REST APIs",
    "Practice PostgreSQL",
    "Build Docker projects"
  ]
}
```

⚠️ Ne jamais mettre une clé API IA secrète directement dans Flutter.

**Livrable** : Analyse profil → Skill Gap → recommandations → matching avec score.

### 5. UI/UX + QA (`feature/ux-qa`)

**Partie UX/UI** : créer/valider le design des écrans (Splash, Login, Register, Dashboard, Profile, Skill Passport, Skill Gap, Opportunities, Opportunity Detail, Matching). Définir couleurs, typographie, boutons, cartes, icônes, espacements, composants réutilisables — une identité visuelle cohérente sur toute l'application.

**Partie QA** : tester progressivement Auth (inscription valide, mauvais mot de passe, email invalide, connexion, déconnexion), Profil (modification, sauvegarde, affichage), Skill Gap (profil complet/incomplet, résultat IA), Matching (score, compétences correspondantes/manquantes), UI (débordement, boutons, navigation, écran vide, chargement, erreurs).

**Livrable** : design cohérent + rapport des bugs + validation du parcours complet de démonstration.

## 🔥 Règles Git

- Ne jamais travailler directement sur `main`.
- Ne jamais faire de push directement sur `main`.
- Notre branche d'intégration est `develop`.
- Chacun travaille sur sa branche `feature/...`.

Avant de commencer à travailler :

```bash
git checkout develop
git pull origin develop
git checkout feature/ma-branche
```

Quand une fonctionnalité est terminée :

```bash
git add .
git commit -m "feat: description de la fonctionnalité"
git push
```

Puis crée une **Pull Request vers `develop`**. Ne merge jamais ta propre PR sans qu'elle ait été relue.

⚠️ Ne jamais envoyer de mot de passe, token ou clé API dans GitHub.

## 🧩 Ordre de développement

Pour éviter que chacun développe dans son coin, on avance dans cet ordre :

1. **Base** — Firebase + Auth + modèles
2. **Profil** — Profile + Skill Passport
3. **Dashboard** — vue générale du profil
4. **IA** — Analyse → Skill Gap → recommandations
5. **Opportunités** — liste → détail → candidature
6. **Matching** — profil → opportunité → score
7. **Intégration** — tout connecter
8. **QA** — tests + corrections + démo
