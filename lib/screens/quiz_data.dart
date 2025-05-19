class QuizQuestion {
  final String text;
  final List<String> answers;

  QuizQuestion(this.text, this.answers);

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}

class QuizData {
  final String title;
  final List<QuizQuestion> questions;

  QuizData({required this.title, required this.questions});
}

// Quiz data instances
final QuizData englishQuiz = QuizData(
  title: 'English',
  questions: [
    QuizQuestion(
      'What color is the sun?',
      ['Yellow', 'Blue', 'Red', 'Green'],
    ),
    QuizQuestion(
      'How many legs does a cat have?',
      ['4', '2', '6', '8'],
    ),
    QuizQuestion(
      'Which animal says "Meow"?',
      ['Cat', 'Dog', 'Cow', 'Bird'],
    ),
    QuizQuestion(
      'What color are bananas?',
      ['Yellow', 'Green', 'Red', 'Blue'],
    ),
    QuizQuestion(
      'What shape is a traffic sign?',
      ['Circle', 'Square', 'Triangle', 'Star'],
    ),
    QuizQuestion(
      'Which month comes after April?',
      ['May', 'March', 'June', 'July'],
    ),
    QuizQuestion(
      'What do you use to brush your teeth?',
      ['Toothbrush', 'Comb', 'Spoon', 'Shoe'],
    ),
    QuizQuestion(
      'What do you wear on your feet?',
      ['Shoes', 'Hat', 'Gloves', 'Scarf'],
    ),
    QuizQuestion(
      'What do you use to write with?',
      ['Pencil', 'Brush', 'Hammer', 'Screwdriver'],
    ),
    QuizQuestion(
      'What is the opposite of cold?',
      ['Hot', 'Wet', 'Dry', 'Warm'],
    ),
  ],
);

final QuizData colorQuiz = QuizData(
  title: 'Colors',
  questions: [
    QuizQuestion(
      'What color is the sky? 🌌',
      ['Blue', 'Green', 'Red', 'Yellow'],
    ),
    QuizQuestion(
      'What color are bananas? 🍌',
      ['Yellow', 'Blue', 'Green', 'Red'],
    ),
    QuizQuestion(
      'What color is grass?',
      ['Green', 'Blue', 'Yellow', 'Red'],
    ),
    QuizQuestion(
      'What color is a fire truck?',
      ['Red', 'Blue', 'Yellow', 'Green'],
    ),
    QuizQuestion(
      'What color is a school bus?',
      ['Yellow', 'Blue', 'Green', 'Red'],
    ),
    QuizQuestion(
      'What color is a basketball?',
      ['Orange', 'Blue', 'Green', 'Red'],
    ),
    QuizQuestion(
      'What color is chocolate?',
      ['Brown', 'Black', 'White', 'Yellow'],
    ),
    QuizQuestion(
      'What color is a frog?',
      ['Green', 'Blue', 'Yellow', 'Red'],
    ),
    QuizQuestion(
      'What color is a snowman?',
      ['White', 'Blue', 'Yellow', 'Red'],
    ),
    QuizQuestion(
      'What color is a banana peel?',
      ['Yellow', 'Blue', 'Green', 'Red'],
    ),
  ],
);

final QuizData abcQuiz = QuizData(
  title: 'Abc',
  questions: [
    QuizQuestion(
      'What letter comes after A?',
      ['B', 'C', 'D', 'E'],
    ),
    QuizQuestion(
      'What letter comes before C?',
      ['B', 'A', 'D', 'E'],
    ),
    QuizQuestion(
      'Which letter is a vowel?',
      ['A', 'B', 'C', 'D'],
    ),
    QuizQuestion(
      'Which letter sounds like "ay"?',
      ['A', 'E', 'I', 'O'],
    ),
    QuizQuestion(
      'What is the last letter in the alphabet?',
      ['Y', 'Z', 'X', 'W'],
    ),
    QuizQuestion(
      'Which letter is often used to start the alphabet?',
      ['A', 'B', 'C', 'D'],
    ),
    QuizQuestion(
      'What letter makes the "sss" sound in "snake"?',
      ['S', 'C', 'T', 'K'],
    ),
    QuizQuestion(
      'Which letter is not in the word "abc"?',
      ['D', 'E', 'F', 'G'],
    ),
    QuizQuestion(
      'What letter is used to represent grades that are excellent?',
      ['A', 'B', 'C', 'D'],
    ),
    QuizQuestion(
      'Which letter is used to start the word "apple"?',
      ['A', 'P', 'B', 'E'],
    ),
  ],
);

final QuizData numberQuiz = QuizData(
  title: 'Mathematics',
  questions: [
    QuizQuestion(
      'What is 5 + 3?',
      ['7', '8', '6', '10'],
    ),
    QuizQuestion(
      'What is 10 - 4?',
      ['6', '4', '5', '3'],
    ),
    QuizQuestion(
      'What is 2 * 3?',
      ['6', '5', '4', '8'],
    ),
    QuizQuestion(
      'What is 12 / 3?',
      ['4', '3', '2', '6'],
    ),
    QuizQuestion(
      'What is 15 - 7?',
      ['8', '6', '7', '9'],
    ),
    QuizQuestion(
      'What is 4 * 5?',
      ['20', '16', '24', '18'],
    ),
    QuizQuestion(
      'What is 9 / 3?',
      ['3', '2', '4', '1'],
    ),
    QuizQuestion(
      'What is 25 - 12?',
      ['13', '14', '15', '12'],
    ),
    QuizQuestion(
      'What is 7 * 4?',
      ['28', '30', '24', '32'],
    ),
    QuizQuestion(
      'What is 18 / 6?',
      ['3', '4', '2', '6'],
    ),
  ],
);
