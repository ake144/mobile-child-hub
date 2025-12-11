// Quiz BLoC - Handles quiz gameplay

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/quiz.dart';
import '../../services/hive_service.dart';
import '../../data/datasources/quiz_data.dart';

// Events
abstract class QuizEvent extends Equatable {
  const QuizEvent();
  @override
  List<Object?> get props => [];
}

class LoadQuiz extends QuizEvent {
  final String storyId;
  const LoadQuiz(this.storyId);
  @override
  List<Object?> get props => [storyId];
}

class AnswerQuestion extends QuizEvent {
  final int selectedIndex;
  const AnswerQuestion(this.selectedIndex);
  @override
  List<Object?> get props => [selectedIndex];
}

class NextQuestion extends QuizEvent {}

class UseHint extends QuizEvent {}

class RestartQuiz extends QuizEvent {}

// State
enum QuizStatus { loading, playing, answered, completed }

class QuizState extends Equatable {
  final String storyId;
  final List<Quiz> questions;
  final int currentIndex;
  final int score;
  final int? selectedAnswer;
  final bool isCorrect;
  final bool hintUsed;
  final QuizStatus status;
  final String? error;

  const QuizState({
    this.storyId = '',
    this.questions = const [],
    this.currentIndex = 0,
    this.score = 0,
    this.selectedAnswer,
    this.isCorrect = false,
    this.hintUsed = false,
    this.status = QuizStatus.loading,
    this.error,
  });

  Quiz? get currentQuestion =>
      questions.isNotEmpty && currentIndex < questions.length
          ? questions[currentIndex]
          : null;

  int get totalQuestions => questions.length;

  bool get isLastQuestion => currentIndex >= questions.length - 1;

  double get progress =>
      questions.isEmpty ? 0 : (currentIndex + 1) / questions.length;

  int get percentage =>
      questions.isEmpty ? 0 : ((score / questions.length) * 100).round();

  QuizState copyWith({
    String? storyId,
    List<Quiz>? questions,
    int? currentIndex,
    int? score,
    int? selectedAnswer,
    bool? isCorrect,
    bool? hintUsed,
    QuizStatus? status,
    String? error,
  }) {
    return QuizState(
      storyId: storyId ?? this.storyId,
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      score: score ?? this.score,
      selectedAnswer: selectedAnswer,
      isCorrect: isCorrect ?? this.isCorrect,
      hintUsed: hintUsed ?? this.hintUsed,
      status: status ?? this.status,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        storyId,
        questions,
        currentIndex,
        score,
        selectedAnswer,
        isCorrect,
        hintUsed,
        status,
        error,
      ];
}

// BLoC
class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(const QuizState()) {
    on<LoadQuiz>(_onLoadQuiz);
    on<AnswerQuestion>(_onAnswerQuestion);
    on<NextQuestion>(_onNextQuestion);
    on<UseHint>(_onUseHint);
    on<RestartQuiz>(_onRestartQuiz);
  }

  Future<void> _onLoadQuiz(
    LoadQuiz event,
    Emitter<QuizState> emit,
  ) async {
    emit(state.copyWith(status: QuizStatus.loading));

    try {
      // Check Hive first
      var quizzes = HiveService.getQuizzesForStory(event.storyId);

      if (quizzes.isEmpty) {
        // Initialize with default quizzes
        quizzes = QuizData.getQuizzesForStory(event.storyId);
        for (final quiz in quizzes) {
          await HiveService.saveQuiz(quiz);
        }
      }

      emit(QuizState(
        storyId: event.storyId,
        questions: quizzes,
        status: QuizStatus.playing,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: QuizStatus.loading,
        error: e.toString(),
      ));
    }
  }

  void _onAnswerQuestion(
    AnswerQuestion event,
    Emitter<QuizState> emit,
  ) {
    if (state.currentQuestion == null) return;

    final isCorrect = event.selectedIndex == state.currentQuestion!.correctIndex;
    final newScore = isCorrect ? state.score + 1 : state.score;

    emit(state.copyWith(
      selectedAnswer: event.selectedIndex,
      isCorrect: isCorrect,
      score: newScore,
      status: QuizStatus.answered,
    ));
  }

  void _onNextQuestion(
    NextQuestion event,
    Emitter<QuizState> emit,
  ) {
    if (state.isLastQuestion) {
      emit(state.copyWith(status: QuizStatus.completed));
    } else {
      emit(state.copyWith(
        currentIndex: state.currentIndex + 1,
        selectedAnswer: null,
        isCorrect: false,
        hintUsed: false,
        status: QuizStatus.playing,
      ));
    }
  }

  void _onUseHint(
    UseHint event,
    Emitter<QuizState> emit,
  ) {
    emit(state.copyWith(hintUsed: true));
  }

  void _onRestartQuiz(
    RestartQuiz event,
    Emitter<QuizState> emit,
  ) {
    emit(QuizState(
      storyId: state.storyId,
      questions: state.questions,
      status: QuizStatus.playing,
    ));
  }
}
