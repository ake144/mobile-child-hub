import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:confetti/confetti.dart';
import '../../core/theme/app_theme.dart';
import '../../data/models/story.dart';
import '../blocs/settings_bloc.dart';
import '../blocs/progress_bloc.dart';
import '../blocs/quiz_bloc.dart';

class QuizScreen extends StatefulWidget {
  final Story story;

  const QuizScreen({super.key, required this.story});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.getBookColor(widget.story.bookEn);

    return BlocProvider(
      create: (_) => QuizBloc()..add(LoadQuiz(widget.story.id)),
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, settings) {
                  return Text(settings.languageCode == 'am' ? 'ፈተና' : 'Quiz');
                },
              ),
              backgroundColor: color,
              foregroundColor: Colors.white,
            ),
            body: BlocConsumer<QuizBloc, QuizState>(
              listener: (context, state) {
                if (state.status == QuizStatus.completed) {
                  if (state.percentage >= 80) {
                    _confettiController.play();
                  }
                  context.read<ProgressBloc>().add(
                    RecordQuizScore(widget.story.id, state.score, state.totalQuestions),
                  );
                }
              },
              builder: (context, state) {
                if (state.status == QuizStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.status == QuizStatus.completed) {
                  return _buildResultsView(context, state, color);
                }
                return _buildQuizView(context, state, color);
              },
            ),
          ),
          // Confetti
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              particleDrag: 0.05,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.1,
              colors: const [
                Colors.green, Colors.blue, Colors.pink, Colors.orange, Colors.purple,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizView(BuildContext context, QuizState state, Color color) {
    final settings = context.watch<SettingsBloc>().state;
    final isAm = settings.languageCode == 'am';
    final question = state.currentQuestion!;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Progress
            Row(
              children: [
                Text(
                  '${isAm ? "ጥያቄ" : "Question"} ${state.currentIndex + 1}/${state.totalQuestions}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppTheme.goldColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: AppTheme.goldColor, size: 18),
                      const SizedBox(width: 4),
                      Text('${state.score}', style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: state.progress,
              backgroundColor: color.withValues(alpha: 0.2),
              valueColor: AlwaysStoppedAnimation(color),
              borderRadius: BorderRadius.circular(10),
            ),
            const SizedBox(height: 32),
            // Question
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  question.getQuestion(settings.languageCode),
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
              ),
            ).animate().fadeIn().scale(),
            const SizedBox(height: 24),
            // Options
            Expanded(
              child: ListView.builder(
                itemCount: question.getOptions(settings.languageCode).length,
                itemBuilder: (context, index) {
                  final options = question.getOptions(settings.languageCode);
                  final isSelected = state.selectedAnswer == index;
                  final isAnswered = state.status == QuizStatus.answered;
                  final isCorrect = index == question.correctIndex;

                  Color? bgColor;
                  if (isAnswered) {
                    if (isCorrect) {
                      bgColor = AppTheme.successColor.withValues(alpha: 0.2);
                    } else if (isSelected) {
                      bgColor = AppTheme.errorColor.withValues(alpha: 0.2);
                    }
                  } else if (isSelected) {
                    bgColor = color.withValues(alpha: 0.1);
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: isAnswered ? null : () {
                        context.read<QuizBloc>().add(AnswerQuestion(index));
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: bgColor ?? Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected ? color : Colors.grey.withValues(alpha: 0.3),
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: color.withValues(alpha: 0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  String.fromCharCode(65 + index),
                                  style: TextStyle(
                                    color: color,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                options[index],
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                            if (isAnswered && isCorrect)
                              const Icon(Icons.check_circle, color: AppTheme.successColor),
                            if (isAnswered && isSelected && !isCorrect)
                              const Icon(Icons.cancel, color: AppTheme.errorColor),
                          ],
                        ),
                      ),
                    ),
                  ).animate().fadeIn(delay: Duration(milliseconds: 100 * index));
                },
              ),
            ),
            // Next Button
            if (state.status == QuizStatus.answered)
              ElevatedButton(
                onPressed: () => context.read<QuizBloc>().add(NextQuestion()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  minimumSize: const Size(double.infinity, 56),
                ),
                child: Text(
                  state.isLastQuestion
                      ? (isAm ? 'ውጤት ይመልከቱ' : 'See Results')
                      : (isAm ? 'ቀጣይ' : 'Next'),
                ),
              ).animate().fadeIn().slideY(begin: 0.3),
          ],
        ),
      ),
    );
  }

  Widget _buildResultsView(BuildContext context, QuizState state, Color color) {
    final settings = context.watch<SettingsBloc>().state;
    final isAm = settings.languageCode == 'am';
    final percentage = state.percentage;

    String message;
    IconData icon;
    if (percentage >= 80) {
      message = isAm ? 'እጅግ በጣም ጥሩ!' : 'Excellent!';
      icon = Icons.emoji_events_rounded;
    } else if (percentage >= 60) {
      message = isAm ? 'ጥሩ ነው!' : 'Good Job!';
      icon = Icons.thumb_up_rounded;
    } else {
      message = isAm ? 'እንደገና ሞክር!' : 'Try Again!';
      icon = Icons.refresh_rounded;
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 80, color: color),
            ).animate().scale(duration: 600.ms, curve: Curves.elasticOut),
            const SizedBox(height: 24),
            Text(
              message,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
            ).animate().fadeIn(delay: 300.ms),
            const SizedBox(height: 16),
            Text(
              '${state.score}/${state.totalQuestions}',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ).animate().fadeIn(delay: 500.ms),
            const SizedBox(height: 8),
            Text(
              '$percentage%',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: color,
                  ),
            ).animate().fadeIn(delay: 700.ms),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: () => context.read<QuizBloc>().add(RestartQuiz()),
                  icon: const Icon(Icons.refresh),
                  label: Text(isAm ? 'እንደገና' : 'Retry'),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: color),
                  icon: const Icon(Icons.home),
                  label: Text(isAm ? 'ወደ ዋና' : 'Home'),
                ),
              ],
            ).animate().fadeIn(delay: 900.ms),
          ],
        ),
      ),
    );
  }
}
