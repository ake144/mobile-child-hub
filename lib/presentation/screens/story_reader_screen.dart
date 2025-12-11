import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/app_theme.dart';
import '../../data/models/story.dart';
import '../../services/tts_service.dart';
import '../blocs/settings_bloc.dart';
import '../blocs/progress_bloc.dart';
import 'quiz_screen.dart';

class StoryReaderScreen extends StatefulWidget {
  final Story story;

  const StoryReaderScreen({super.key, required this.story});

  @override
  State<StoryReaderScreen> createState() => _StoryReaderScreenState();
}

class _StoryReaderScreenState extends State<StoryReaderScreen> {
  final TTSService _tts = TTSService();
  bool _isSpeaking = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _tts.stop();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsBloc>().state;
    final progress = context.watch<ProgressBloc>().state.progress;
    final isAm = settings.languageCode == 'am';
    final isFavorite = progress.favoriteStories.contains(widget.story.id);
    final color = AppTheme.getBookColor(widget.story.bookEn);

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Header
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: color,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                ),
                onPressed: () {
                  context.read<ProgressBloc>().add(
                        ToggleFavorite(widget.story.id),
                      );
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.story.getTitle(settings.languageCode),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color, color.withValues(alpha: 0.7)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.auto_stories_rounded,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Verse References
                  Wrap(
                    spacing: 8,
                    children: widget.story.verseReferences.map((ref) {
                      return Chip(
                        label: Text(
                          ref,
                          style: TextStyle(color: color, fontSize: 12),
                        ),
                        backgroundColor: color.withValues(alpha: 0.1),
                        side: BorderSide.none,
                      );
                    }).toList(),
                  ).animate().fadeIn(),
                  const SizedBox(height: 24),
                  // Story Content
                  Text(
                    widget.story.getContent(settings.languageCode),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1.8,
                          fontSize: 17,
                        ),
                  ).animate().fadeIn(delay: 200.ms),
                  const SizedBox(height: 40),
                  // Take Quiz Button
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () => _completeAndTakeQuiz(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                      icon: const Icon(Icons.quiz_rounded),
                      label: Text(
                        isAm ? 'ፈተና ውሰድ' : 'Take Quiz',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ).animate().fadeIn(delay: 400.ms).scale(),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      // TTS FAB
      floatingActionButton: settings.isTTSEnabled
          ? FloatingActionButton(
              backgroundColor: color,
              onPressed: _toggleTTS,
              child: Icon(
                _isSpeaking ? Icons.stop_rounded : Icons.volume_up_rounded,
              ),
            ).animate().scale(delay: 500.ms)
          : null,
    );
  }

  void _toggleTTS() async {
    final settings = context.read<SettingsBloc>().state;
    
    if (_isSpeaking) {
      await _tts.stop();
      setState(() => _isSpeaking = false);
    } else {
      await _tts.setLanguage(settings.languageCode);
      await _tts.speak(widget.story.getContent(settings.languageCode));
      setState(() => _isSpeaking = true);
    }
  }

  void _completeAndTakeQuiz(BuildContext context) {
    // Mark story as completed
    context.read<ProgressBloc>().add(CompleteStory(widget.story.id));
    context.read<ProgressBloc>().add(UpdateStreak());

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuizScreen(story: widget.story),
      ),
    );
  }
}
