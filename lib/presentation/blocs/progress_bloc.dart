// Progress BLoC - Handles user progress, points, badges, streaks

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/user_progress.dart';
import '../../services/hive_service.dart';

// Events
abstract class ProgressEvent extends Equatable {
  const ProgressEvent();
  @override
  List<Object?> get props => [];
}

class LoadProgress extends ProgressEvent {}

class CompleteStory extends ProgressEvent {
  final String storyId;
  const CompleteStory(this.storyId);
  @override
  List<Object?> get props => [storyId];
}

class RecordQuizScore extends ProgressEvent {
  final String storyId;
  final int score;
  final int totalQuestions;
  const RecordQuizScore(this.storyId, this.score, this.totalQuestions);
  @override
  List<Object?> get props => [storyId, score, totalQuestions];
}

class AddPoints extends ProgressEvent {
  final int points;
  const AddPoints(this.points);
  @override
  List<Object?> get props => [points];
}

class ToggleFavorite extends ProgressEvent {
  final String storyId;
  const ToggleFavorite(this.storyId);
  @override
  List<Object?> get props => [storyId];
}

class UpdateStreak extends ProgressEvent {}

class EarnBadge extends ProgressEvent {
  final String badgeId;
  const EarnBadge(this.badgeId);
  @override
  List<Object?> get props => [badgeId];
}

// State
class ProgressState extends Equatable {
  final UserProgress progress;
  final bool isLoading;
  final String? newBadgeEarned;
  final bool leveledUp;
  final int? previousLevel;
  final int updateToken; // Forces rebuilds when mutable state changes

  const ProgressState({
    required this.progress,
    this.isLoading = true,
    this.newBadgeEarned,
    this.leveledUp = false,
    this.previousLevel,
    this.updateToken = 0,
  });

  ProgressState copyWith({
    UserProgress? progress,
    bool? isLoading,
    String? newBadgeEarned,
    bool? leveledUp,
    int? previousLevel,
  }) {
    return ProgressState(
      progress: progress ?? this.progress,
      isLoading: isLoading ?? this.isLoading,
      newBadgeEarned: newBadgeEarned,
      leveledUp: leveledUp ?? false,
      previousLevel: previousLevel,
      updateToken: DateTime.now().millisecondsSinceEpoch,
    );
  }

  @override
  List<Object?> get props => [
        progress,
        isLoading,
        newBadgeEarned,
        leveledUp,
        previousLevel,
        updateToken,
      ];
}

// BLoC
class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  ProgressBloc()
      : super(ProgressState(progress: UserProgress())) {
    on<LoadProgress>(_onLoadProgress);
    on<CompleteStory>(_onCompleteStory);
    on<RecordQuizScore>(_onRecordQuizScore);
    on<AddPoints>(_onAddPoints);
    on<ToggleFavorite>(_onToggleFavorite);
    on<UpdateStreak>(_onUpdateStreak);
    on<EarnBadge>(_onEarnBadge);
  }

  Future<void> _onLoadProgress(
    LoadProgress event,
    Emitter<ProgressState> emit,
  ) async {
    final progress = HiveService.getProgress();
    emit(state.copyWith(progress: progress, isLoading: false));
  }

  Future<void> _onCompleteStory(
    CompleteStory event,
    Emitter<ProgressState> emit,
  ) async {
    final progress = state.progress;
    progress.completeStory(event.storyId);
    await HiveService.saveProgress(progress);
    emit(state.copyWith(progress: progress));
    
    // Check for badges
    _checkBadges(emit);
  }

  Future<void> _onRecordQuizScore(
    RecordQuizScore event,
    Emitter<ProgressState> emit,
  ) async {
    final progress = state.progress;
    final previousLevel = progress.level;
    
    // Calculate points based on percentage
    final percentage = event.score / event.totalQuestions;
    int points = 0;
    
    if (percentage >= 1.0) {
      points = 50; // Perfect score
    } else if (percentage >= 0.8) {
      points = 30;
    } else if (percentage >= 0.6) {
      points = 20;
    } else {
      points = 10;
    }
    
    progress.recordQuizScore(event.storyId, event.score);
    progress.addPoints(points);
    await HiveService.saveProgress(progress);
    
    final leveledUp = progress.level > previousLevel;
    emit(state.copyWith(
      progress: progress,
      leveledUp: leveledUp,
      previousLevel: leveledUp ? previousLevel : null,
    ));
    
    // Check for badges
    _checkBadges(emit);
  }

  Future<void> _onAddPoints(
    AddPoints event,
    Emitter<ProgressState> emit,
  ) async {
    final progress = state.progress;
    final previousLevel = progress.level;
    
    progress.addPoints(event.points);
    await HiveService.saveProgress(progress);
    
    final leveledUp = progress.level > previousLevel;
    emit(state.copyWith(
      progress: progress,
      leveledUp: leveledUp,
      previousLevel: leveledUp ? previousLevel : null,
    ));
  }

  Future<void> _onToggleFavorite(
    ToggleFavorite event,
    Emitter<ProgressState> emit,
  ) async {
    final progress = state.progress;
    progress.toggleFavorite(event.storyId);
    await HiveService.saveProgress(progress);
    emit(state.copyWith(progress: progress));
  }

  Future<void> _onUpdateStreak(
    UpdateStreak event,
    Emitter<ProgressState> emit,
  ) async {
    final progress = state.progress;
    progress.updateStreak();
    await HiveService.saveProgress(progress);
    emit(state.copyWith(progress: progress));
    
    // Check for streak badges
    _checkBadges(emit);
  }

  Future<void> _onEarnBadge(
    EarnBadge event,
    Emitter<ProgressState> emit,
  ) async {
    final progress = state.progress;
    if (!progress.earnedBadges.contains(event.badgeId)) {
      progress.earnBadge(event.badgeId);
      await HiveService.saveProgress(progress);
      emit(state.copyWith(
        progress: progress,
        newBadgeEarned: event.badgeId,
      ));
    }
  }

  void _checkBadges(Emitter<ProgressState> emit) {
    final progress = state.progress;
    
    // Check various badge conditions
    // First Story badge
    if (progress.totalStoriesRead >= 1 && 
        !progress.earnedBadges.contains('first_story')) {
      add(const EarnBadge('first_story'));
    }
    
    // Story Master badges
    if (progress.totalStoriesRead >= 5 && 
        !progress.earnedBadges.contains('story_explorer')) {
      add(const EarnBadge('story_explorer'));
    }
    
    if (progress.totalStoriesRead >= 12 && 
        !progress.earnedBadges.contains('story_master')) {
      add(const EarnBadge('story_master'));
    }
    
    // Quiz badges
    if (progress.totalQuizzesCompleted >= 1 && 
        !progress.earnedBadges.contains('quiz_starter')) {
      add(const EarnBadge('quiz_starter'));
    }
    
    if (progress.totalQuizzesCompleted >= 10 && 
        !progress.earnedBadges.contains('quiz_champion')) {
      add(const EarnBadge('quiz_champion'));
    }
    
    // Streak badges
    if (progress.currentStreak >= 3 && 
        !progress.earnedBadges.contains('streak_3')) {
      add(const EarnBadge('streak_3'));
    }
    
    if (progress.currentStreak >= 7 && 
        !progress.earnedBadges.contains('streak_7')) {
      add(const EarnBadge('streak_7'));
    }
    
    if (progress.currentStreak >= 30 && 
        !progress.earnedBadges.contains('streak_30')) {
      add(const EarnBadge('streak_30'));
    }
    
    // Points badges
    if (progress.totalPoints >= 100 && 
        !progress.earnedBadges.contains('points_100')) {
      add(const EarnBadge('points_100'));
    }
    
    if (progress.totalPoints >= 500 && 
        !progress.earnedBadges.contains('points_500')) {
      add(const EarnBadge('points_500'));
    }
  }
}
