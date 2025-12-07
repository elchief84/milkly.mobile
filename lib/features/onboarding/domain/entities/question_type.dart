/// Type of question in the questionnaire
enum QuestionType {
  text,
  date,
  time,
  number,
  singleChoice,
  multipleChoice;

  static QuestionType fromString(String value) {
    switch (value) {
      case 'text':
        return QuestionType.text;
      case 'date':
        return QuestionType.date;
      case 'time':
        return QuestionType.time;
      case 'number':
        return QuestionType.number;
      case 'single_choice':
        return QuestionType.singleChoice;
      case 'multiple_choice':
        return QuestionType.multipleChoice;
      default:
        throw ArgumentError('Unknown question type: $value');
    }
  }

  String toJsonString() {
    switch (this) {
      case QuestionType.text:
        return 'text';
      case QuestionType.date:
        return 'date';
      case QuestionType.time:
        return 'time';
      case QuestionType.number:
        return 'number';
      case QuestionType.singleChoice:
        return 'single_choice';
      case QuestionType.multipleChoice:
        return 'multiple_choice';
    }
  }
}
