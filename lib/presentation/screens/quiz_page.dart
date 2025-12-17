import 'package:bible_stories/core/theme/app_theme.dart';
import 'package:bible_stories/presentation/blocs/settings_bloc.dart';
import 'package:bible_stories/presentation/blocs/stories_bloc.dart';
import 'package:bible_stories/presentation/screens/quiz_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizPage extends StatelessWidget {
  
   const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {

    final setting =  context.watch<SettingsBloc>().state;

    final theme = Theme.of(context);
    final isAm = setting.languageCode == 'am';


    return Scaffold(
      appBar: AppBar(
        title: Text(isAm ? 'መጠየቂያ' : 'Quiz', style: theme.textTheme.headlineMedium),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: SafeArea(child:
           CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child:  const SizedBox(height: 30)),
              SliverToBoxAdapter(
                  child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                  isAm ? 'መጠየቂያ ምን ነው?' : 'Select a Book to take a Quiz?',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: theme.textTheme.headlineMedium?.color?.withValues(alpha: 0.8),
                    
                  ),
                  ),
                ).animate().fadeIn(),
              ),

              SliverToBoxAdapter(child: const SizedBox(height: 20)),
             
             BlocBuilder<StoriesBloc,StoriesState>( 
              builder: (context, state){ 
                 if (state.isLoading) {
                return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return SliverPadding(
                padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 3 / 2,
                  ),
                  delegate: SliverChildListDelegate(
                    [
                      _BookCard(
                        titleEn: 'Genesis',
                        titleAm: 'ዘፍጥረት',
                        icon: Icons.wb_sunny_rounded,
                        color: AppTheme.genesisColor,
                        storyCount: _getStoryCount(state.allStories, 'Genesis'),
                        delay: 0,
                      ),
                      _BookCard(
                        titleEn: 'Exodus',
                        titleAm: 'ዘጸአት',
                        icon: Icons.directions_walk_rounded,
                        color: AppTheme.exodusColor,
                        storyCount: _getStoryCount(state.allStories, 'Exodus'),
                        delay: 100,
                      ),
                      _BookCard(
                        titleEn: 'Leviticus',
                        titleAm: 'ዘሌዋውያን',
                        icon: Icons.local_fire_department_rounded,
                        color: AppTheme.leviticusColor,
                        storyCount: _getStoryCount(state.allStories, 'Leviticus'),
                        delay: 200,
                      ),
                    ],
                  ),
                ),

              );
              }
             )
              

              // Add your quiz content here

            ],
           )
          )
    );
  }
  }


// Small helper to count stories for a given book name.
int _getStoryCount(List<dynamic> allStories, String bookName) {
   return allStories.where((s) => s.bookEn == bookName).length;
}

// Simple card widget for each book entry.
class _BookCard extends StatelessWidget {
  final String titleEn;
  final String titleAm;
  final IconData icon;
  final Color color;
  final int? storyCount;
  final int delay;

  const _BookCard({
    required this.titleEn,
    required this.titleAm,
    required this.icon,
    required this.color,
     this.storyCount,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isAm = context.watch<SettingsBloc>().state.languageCode == 'am';
    return Card(
      color: color,
      child: InkWell(
        onTap: () {
            Navigator.push(context,
             MaterialPageRoute(builder: 
             (context) => QuizList(bookEn: titleEn, bookAm: titleAm)));
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 28, color: Colors.white),
              const SizedBox(height: 8),
              Text(
                isAm ? titleAm : titleEn,
                style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
              ),
              const Spacer(),
              Text(
                '$storyCount ${isAm ? "" : "quizes"}',
                style: theme.textTheme.bodySmall?.copyWith(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}