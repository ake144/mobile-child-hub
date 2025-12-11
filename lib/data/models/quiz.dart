import 'package:hive/hive.dart';

part 'quiz.g.dart';

@HiveType(typeId: 1)
class Quiz extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String storyId;

  @HiveField(2)
  final String questionEn;

  @HiveField(3)
  final String questionAm;

  @HiveField(4)
  final List<String> optionsEn;

  @HiveField(5)
  final List<String> optionsAm;

  @HiveField(6)
  final int correctIndex;

  @HiveField(7)
  final int points;

  @HiveField(8)
  final String? hintEn;

  @HiveField(9)
  final String? hintAm;

  Quiz({
    required this.id,
    required this.storyId,
    required this.questionEn,
    required this.questionAm,
    required this.optionsEn,
    required this.optionsAm,
    required this.correctIndex,
    this.points = 10,
    this.hintEn,
    this.hintAm,
  });

  String getQuestion(String locale) => locale == 'am' ? questionAm : questionEn;
  List<String> getOptions(String locale) => locale == 'am' ? optionsAm : optionsEn;
  String? getHint(String locale) => locale == 'am' ? hintAm : hintEn;
}
