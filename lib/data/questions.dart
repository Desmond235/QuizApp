import 'package:quiz_app/models/quiz_questions.dart';

const questions = [
  QuizQuestions(
    text: 'What are the main building blocks of flutter UIs?',
    answer: [
      'Widgets',
      'Components',
      'Blocks',
      'Functions',
    ],
  ),
  QuizQuestions(
    text: 'How are flutter UIs built?',
    answer: [
      'By combining widgets in code',
      'By combining widgets in a visual editor',
      'By defining widgets in config files',
      'By using xcode for iOS and Android Studio for Android',
    ],
  ),
  QuizQuestions(
    text: 'What\'s the purpose of a StatefulWidget?',
    answer: [
      'Update UI as data changes',
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that does not depend on data',
    ],
  ),
  QuizQuestions(
    text: 'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    answer: [
      'StatelessWidget',
      'StatefulWidget',
      'Both  are equally good',
      'None of the above',
    ],
  ),
  QuizQuestions(
    text: 'What happens if you change data is a StatelessWidget?',
    answer: [
      'The UI is not updated',
      'The UI is updated',
      'The closest StatefulWidget is updated',
      'Any nested  StatefulWidget are updated',
    ],
  ),
  QuizQuestions(
    text: 'How shoud you update data inside of StatefulWidgets?',
    answer: [
      'By calling setState()',
      'By calling updateData()',
      'By calling updateUI()',
      'By calling updateState()',
    ],
  ),
];
