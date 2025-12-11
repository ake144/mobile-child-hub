import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/app_theme.dart';
import '../blocs/settings_bloc.dart';
import '../blocs/progress_bloc.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsBloc>().state;
    final isAm = settings.languageCode == 'am';

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<ProgressBloc, ProgressState>(
          builder: (context, state) {
            final progress = state.progress;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isAm ? 'የእኔ እድገት' : 'My Progress',
                  style: Theme.of(context).textTheme.headlineMedium,
                ).animate().fadeIn(),
                const SizedBox(height: 24),
                // Level Card
                _LevelCard(
                  level: progress.level,
                  points: progress.totalPoints,
                  pointsToNext: progress.pointsToNextLevel,
                ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1),
                const SizedBox(height: 24),
                // Stats Grid
                Row(
                  children: [
                    Expanded(
                      child: _StatCard(
                        icon: Icons.auto_stories_rounded,
                        value: '${progress.totalStoriesRead}',
                        label: isAm ? 'ታሪኮች' : 'Stories',
                        color: AppTheme.genesisColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _StatCard(
                        icon: Icons.quiz_rounded,
                        value: '${progress.totalQuizzesCompleted}',
                        label: isAm ? 'ፈተናዎች' : 'Quizzes',
                        color: AppTheme.exodusColor,
                      ),
                    ),
                  ],
                ).animate().fadeIn(delay: 200.ms),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _StatCard(
                        icon: Icons.local_fire_department_rounded,
                        value: '${progress.currentStreak}',
                        label: isAm ? 'ተከታታይ' : 'Streak',
                        color: AppTheme.secondaryColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _StatCard(
                        icon: Icons.workspace_premium_rounded,
                        value: '${progress.earnedBadges.length}',
                        label: isAm ? 'ሜዳሊያዎች' : 'Badges',
                        color: AppTheme.goldColor,
                      ),
                    ),
                  ],
                ).animate().fadeIn(delay: 300.ms),
                const SizedBox(height: 32),
                // Badges Section
                Text(
                  isAm ? 'ሜዳሊያዎች' : 'Badges',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                _BadgesGrid(earnedBadges: progress.earnedBadges),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _LevelCard extends StatelessWidget {
  final int level;
  final int points;
  final int pointsToNext;

  const _LevelCard({
    required this.level,
    required this.points,
    required this.pointsToNext,
  });

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsBloc>().state;
    final isAm = settings.languageCode == 'am';
    final progressValue = (100 - pointsToNext) / 100;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${isAm ? "ደረጃ" : "Level"} $level',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$points ${isAm ? "ነጥቦች" : "points"}',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$level',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isAm ? 'ቀጣይ ደረጃ' : 'Next Level',
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.9)),
                  ),
                  Text(
                    '$pointsToNext ${isAm ? "ነጥቦች" : "points"}',
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.9)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: progressValue,
                  backgroundColor: Colors.white.withValues(alpha: 0.3),
                  valueColor: const AlwaysStoppedAnimation(Colors.white),
                  minHeight: 8,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
                ),
          ),
        ],
      ),
    );
  }
}

class _BadgesGrid extends StatelessWidget {
  final List<String> earnedBadges;

  const _BadgesGrid({required this.earnedBadges});

  static const allBadges = [
    {'id': 'first_story', 'icon': Icons.star, 'nameEn': 'First Story', 'nameAm': 'የመጀመሪያ ታሪክ'},
    {'id': 'story_explorer', 'icon': Icons.explore, 'nameEn': 'Explorer', 'nameAm': 'አሳሽ'},
    {'id': 'story_master', 'icon': Icons.school, 'nameEn': 'Story Master', 'nameAm': 'ታሪክ ጌታ'},
    {'id': 'quiz_starter', 'icon': Icons.quiz, 'nameEn': 'Quiz Starter', 'nameAm': 'ፈተና ጀማሪ'},
    {'id': 'quiz_champion', 'icon': Icons.emoji_events, 'nameEn': 'Quiz Champion', 'nameAm': 'ፈተና ሻምፒዮን'},
    {'id': 'streak_3', 'icon': Icons.local_fire_department, 'nameEn': '3 Day Streak', 'nameAm': '3 ቀን ተከታታይ'},
    {'id': 'streak_7', 'icon': Icons.whatshot, 'nameEn': '7 Day Streak', 'nameAm': '7 ቀን ተከታታይ'},
    {'id': 'streak_30', 'icon': Icons.military_tech, 'nameEn': '30 Day Streak', 'nameAm': '30 ቀን ተከታታይ'},
  ];

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsBloc>().state;
    final isAm = settings.languageCode == 'am';

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemCount: allBadges.length,
      itemBuilder: (context, index) {
        final badge = allBadges[index];
        final isEarned = earnedBadges.contains(badge['id']);
        final name = isAm ? badge['nameAm'] as String : badge['nameEn'] as String;

        return Tooltip(
          message: name,
          child: Container(
            decoration: BoxDecoration(
              color: isEarned
                  ? AppTheme.goldColor.withValues(alpha: 0.2)
                  : Colors.grey.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
              border: isEarned
                  ? Border.all(color: AppTheme.goldColor, width: 2)
                  : null,
            ),
            child: Icon(
              badge['icon'] as IconData,
              color: isEarned ? AppTheme.goldColor : Colors.grey,
              size: 28,
            ),
          ),
        ).animate().fadeIn(delay: Duration(milliseconds: index * 50));
      },
    );
  }
}
