import 'package:hive/hive.dart';

part 'user_progress.g.dart';

@HiveType(typeId: 2)
class UserProgress extends HiveObject {
  @HiveField(0)
  int totalPoints;

  @HiveField(1)
  List<String> completedStories;

  @HiveField(2)
  List<String> earnedBadges;

  @HiveField(3)
  int currentStreak;

  @HiveField(4)
  DateTime lastActiveDate;

  @HiveField(5)
  Map<String, int> quizScores; // storyId -> score

  @HiveField(6)
  List<String> favoriteStories;

  @HiveField(7)
  int totalStoriesRead;

  @HiveField(8)
  int totalQuizzesCompleted;

  UserProgress({
    this.totalPoints = 0,
    List<String>? completedStories,
    List<String>? earnedBadges,
    this.currentStreak = 0,
    DateTime? lastActiveDate,
    Map<String, int>? quizScores,
    List<String>? favoriteStories,
    this.totalStoriesRead = 0,
    this.totalQuizzesCompleted = 0,
  })  : completedStories = completedStories ?? [],
        earnedBadges = earnedBadges ?? [],
        lastActiveDate = lastActiveDate ?? DateTime.now(),
        quizScores = quizScores ?? {},
        favoriteStories = favoriteStories ?? [];

  void addPoints(int points) {
    totalPoints += points;
  }

  void completeStory(String storyId) {
    if (!completedStories.contains(storyId)) {
      completedStories.add(storyId);
      totalStoriesRead++;
    }
  }

  void recordQuizScore(String storyId, int score) {
    quizScores[storyId] = score;
    totalQuizzesCompleted++;
  }

  void updateStreak() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final lastActive = DateTime(
      lastActiveDate.year,
      lastActiveDate.month,
      lastActiveDate.day,
    );

    final difference = today.difference(lastActive).inDays;

    if (difference == 1) {
      currentStreak++;
    } else if (difference > 1) {
      currentStreak = 1;
    }
    lastActiveDate = now;
  }

  void earnBadge(String badgeId) {
    if (!earnedBadges.contains(badgeId)) {
      earnedBadges.add(badgeId);
    }
  }

  void toggleFavorite(String storyId) {
    if (favoriteStories.contains(storyId)) {
      favoriteStories.remove(storyId);
    } else {
      favoriteStories.add(storyId);
    }
  }

  int get level => (totalPoints / 100).floor() + 1;
  int get pointsToNextLevel => 100 - (totalPoints % 100);
}
