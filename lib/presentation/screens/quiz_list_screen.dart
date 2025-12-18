import 'package:bible_stories/core/theme/app_theme.dart';
import 'package:bible_stories/presentation/blocs/settings_bloc.dart';
import 'package:bible_stories/presentation/blocs/stories_bloc.dart';
import 'package:bible_stories/presentation/screens/story_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizList extends StatelessWidget {
  final String bookEn;
  final String bookAm;

  const QuizList({super.key, required this.bookEn, required this.bookAm});

  @override
  Widget build(BuildContext context) {
     
     final setting  = context.watch<SettingsBloc>().state;
      final isAm = setting.languageCode == 'am';

     return Scaffold(
      body: 
        CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: AppTheme.primaryColor,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
             expandedHeight: 180,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  isAm ? bookAm : bookEn,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppTheme.primaryColor, AppTheme.primaryColor.withValues(alpha: 0.7)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(23),
                child: Text(
                  'Select a chapter from ${isAm ? bookAm : bookEn} to take a Quiz',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            SliverToBoxAdapter(child:  SizedBox(height: 20)),
            BlocBuilder<StoriesBloc, StoriesState>(
                builder: (context, state){
                  final quizzes =  state.allStories
                  .where((s) => s.bookEn == bookEn || s.bookAm == bookAm)
                  .toList();

                  if (quizzes.isEmpty){
                    return SliverToBoxAdapter(
                      child:Center(child: Text(
                        isAm ? 'ምንም መጠየቂያ የለም' : 'No quizzes available',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                        ));
                  }

                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    sliver: SliverList(
                       delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final quiz = quizzes[index];
                          return StoryCard(
                            story: quiz,
                            isquiz: true,
                            index: index,
                            color: AppTheme.primaryColor,
                          );
                        },
                        childCount: quizzes.length,
                      ),
                    ),
                  );
                },
          ),
        ],
      ),
    );
  }
}
