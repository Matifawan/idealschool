import 'package:flutter/material.dart';

class ViewAll extends StatelessWidget {
  const ViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Educational Activities'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Elevator Pitch'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ElevatorPitchScreen())),
          ),
          ListTile(
            title: const Text('Storytelling'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const StorytellingScreen())),
          ),
          ListTile(
            title: const Text('Inventing a Solution'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const InventingSolutionScreen())),
          ),
          ListTile(
            title: const Text('Quiz'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const QuizScreen(
                          questions: [],
                        ))),
          ),
          ListTile(
            title: const Text('Jumble Sentences & Unscramble Words'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const WordGamesScreen())),
          ),
          ListTile(
            title: const Text('Game Show'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GameShowScreen())),
          ),
          ListTile(
            title: const Text('Bringing Historical Characters Alive'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HistoricalCharactersScreen())),
          ),
        ],
      ),
    );
  }
}

class ElevatorPitchScreen extends StatelessWidget {
  const ElevatorPitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Implementation for Elevator Pitch feature
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elevator Pitch'),
      ),
      body: const Center(
        child: Text('Elevator Pitch Feature Placeholder'),
      ),
    );
  }
}

class StorytellingScreen extends StatelessWidget {
  const StorytellingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Implementation for Storytelling feature
    return Scaffold(
      appBar: AppBar(
        title: const Text('Storytelling'),
      ),
      body: const Center(
        child: Text('Storytelling Feature Placeholder'),
      ),
    );
  }
}

class InventingSolutionScreen extends StatelessWidget {
  const InventingSolutionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Implementation for Inventing a Solution feature
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventing a Solution'),
      ),
      body: const Center(
        child: Text('Inventing a Solution Feature Placeholder'),
      ),
    );
  }
}

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key, required List<dynamic> questions});

  @override
  Widget build(BuildContext context) {
    // Implementation for Quiz feature using Firebase Firestore
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: const Center(
        child: Text('Quiz Feature Placeholder'),
      ),
    );
  }
}

class WordGamesScreen extends StatelessWidget {
  const WordGamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Implementation for Jumble Sentences & Unscramble Words feature using Firebase Firestore
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jumble Sentences & Unscramble Words'),
      ),
      body: const Center(
        child: Text('Word Games Feature Placeholder'),
      ),
    );
  }
}

class GameShowScreen extends StatelessWidget {
  const GameShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Implementation for Game Show feature using Firebase
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Show'),
      ),
      body: const Center(
        child: Text('Game Show Feature Placeholder'),
      ),
    );
  }
}

class HistoricalCharactersScreen extends StatelessWidget {
  const HistoricalCharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Implementation for Bringing Historical Characters Alive feature
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bringing Historical Characters Alive'),
      ),
      body: const Center(
        child: Text('Historical Characters Feature Placeholder'),
      ),
    );
  }
}
