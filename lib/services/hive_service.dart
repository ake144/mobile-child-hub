import 'package:hive_flutter/hive_flutter.dart';
import '../data/models/story.dart';
import '../data/models/quiz.dart';
import '../data/models/user_progress.dart';
import '../data/models/daily_devotional.dart';
import '../data/models/badge.dart';

class HiveService {
  static const String storiesBox = 'stories';
  static const String quizzesBox = 'quizzes';
  static const String progressBox = 'progress';
  static const String devotionalsBox = 'devotionals';
  static const String badgesBox = 'badges';
  static const String settingsBox = 'settings';

  static Future<void> init() async {
    await Hive.initFlutter();

    // Register adapters
    Hive.registerAdapter(StoryAdapter());
    Hive.registerAdapter(QuizAdapter());
    Hive.registerAdapter(UserProgressAdapter());
    Hive.registerAdapter(DailyDevotionalAdapter());
    Hive.registerAdapter(BadgeAdapter());

    // Open boxes
    await Hive.openBox<Story>(storiesBox);
    await Hive.openBox<Quiz>(quizzesBox);
    await Hive.openBox<UserProgress>(progressBox);
    await Hive.openBox<DailyDevotional>(devotionalsBox);
    await Hive.openBox<Badge>(badgesBox);
    await Hive.openBox(settingsBox);
  }

  // Stories
  static Box<Story> get stories => Hive.box<Story>(storiesBox);

  static Future<void> saveStory(Story story) async {
    await stories.put(story.id, story);
  }

  static List<Story> getAllStories() {
    return stories.values.toList();
  }

  static List<Story> getStoriesByBook(String bookEn) {
    return stories.values
        .where((story) => story.bookEn.toLowerCase() == bookEn.toLowerCase())
        .toList()
      ..sort((a, b) => a.order.compareTo(b.order));
  }

  static Story? getStory(String id) {
    return stories.get(id);
  }

  // Quizzes
  static Box<Quiz> get quizzes => Hive.box<Quiz>(quizzesBox);

  static Future<void> saveQuiz(Quiz quiz) async {
    await quizzes.put(quiz.id, quiz);
  }

  static List<Quiz> getQuizzesForStory(String storyId) {
    return quizzes.values
        .where((quiz) => quiz.storyId == storyId)
        .toList();
  }

  // Progress
  static Box<UserProgress> get progress => Hive.box<UserProgress>(progressBox);

  static UserProgress getProgress() {
    final existing = progress.get('user');
    if (existing != null) return existing;
    
    final newProgress = UserProgress();
    progress.put('user', newProgress);
    return newProgress;
  }

  static Future<void> saveProgress(UserProgress userProgress) async {
    await progress.put('user', userProgress);
  }

  // Daily Devotionals
  static Box<DailyDevotional> get devotionals => 
      Hive.box<DailyDevotional>(devotionalsBox);

  static DailyDevotional? getTodayDevotional() {
    final dayOfYear = DateTime.now().difference(
      DateTime(DateTime.now().year, 1, 1),
    ).inDays + 1;
    
    return devotionals.values.firstWhere(
      (d) => d.dayOfYear == dayOfYear,
      orElse: () => devotionals.values.first,
    );
  }

  // Badges
  static Box<Badge> get badges => Hive.box<Badge>(badgesBox);

  static List<Badge> getAllBadges() {
    return badges.values.toList();
  }

  // Settings
  static Box get settings => Hive.box(settingsBox);

  static String getLanguage() {
    return settings.get('language', defaultValue: 'en');
  }

  static Future<void> setLanguage(String locale) async {
    await settings.put('language', locale);
  }

  static bool isDarkMode() {
    return settings.get('darkMode', defaultValue: false);
  }

  static Future<void> setDarkMode(bool value) async {
    await settings.put('darkMode', value);
  }

  static bool isSoundEnabled() {
    return settings.get('soundEnabled', defaultValue: true);
  }

  static Future<void> setSoundEnabled(bool value) async {
    await settings.put('soundEnabled', value);
  }

  static bool isTTSEnabled() {
    return settings.get('ttsEnabled', defaultValue: true);
  }

  static Future<void> setTTSEnabled(bool value) async {
    await settings.put('ttsEnabled', value);
  }

  static double getTTSSpeed() {
    return settings.get('ttsSpeed', defaultValue: 0.5);
  }

  static Future<void> setTTSSpeed(double value) async {
    await settings.put('ttsSpeed', value);
  }
}
