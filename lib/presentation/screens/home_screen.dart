import 'package:bible_stories/presentation/blocs/daily_verse_bloc.dart';
import 'package:bible_stories/presentation/screens/fav_screen.dart';
import 'package:bible_stories/presentation/screens/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/app_theme.dart';
import '../../data/models/story.dart';
import '../blocs/settings_bloc.dart';
import '../blocs/stories_bloc.dart';
import '../blocs/progress_bloc.dart';
import 'story_list_screen.dart';
import 'progress_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _HomeContent(),
          QuizPage(),
          FavoriteStories(),
          ProgressScreen(),
          // SettingsScreen(),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(context),
    
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    final settings = context.watch<SettingsBloc>().state;
    final isAm = settings.languageCode == 'am';

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.auto_stories_rounded),
              label: isAm ? 'ታሪኮች' : 'Stories',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.quiz_sharp),
              label: isAm ? 'ሙከራዎች' : 'Quizzes',
            ),
            
            BottomNavigationBarItem(
                icon: const Icon( Icons.favorite_border_rounded),
                label: isAm ? 'የተወደዱ' : "Favorites",
                ),

                BottomNavigationBarItem(
              icon: const Icon(Icons.emoji_events_rounded),
              label: isAm ? 'እድገት' : 'Progress',
            ),
          ]
            )

             

          
        ),
      );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsBloc>().state;
    final isAm = settings.languageCode == 'am';

    final currentTime = DateTime.now();

    final greeting  = currentTime.hour < 12
        ? (isAm ? 'እንደምን አደሩ' : 'Good Morning')
        : currentTime.hour < 18
            ? (isAm ? 'እንደምን አደሩ' : 'Good Afternoon')
            : (isAm ? 'እንደምን አደሩ' : 'Good Evening');
    
       
    

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isAm ? 'ሰላም! 👋' : 'Hello! 👋',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 4),
                        Text(
                           greeting,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.color
                                    ?.withValues(alpha: 0.7),
                              ),
                        ),
                      ],
                    ).animate().fadeIn().slideX(begin: -0.1),
                  ),
                  Row(
                    children: [
                       _buildStreakBadge(context),
                       const SizedBox(width: 12),
                       IconButton(onPressed: (){
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (_) => SettingsScreen(),
                          ),
                        );  
                        },

                        icon:  Icon(Icons.settings_rounded).animate().fadeIn().slideX(begin: 0.1, delay: 200.ms),
                  )],)
                ],
              ),
            ),
          ),

      
      BlocBuilder<DailyVerseBloc, DailyVerseState>(
        builder: (context, state) {
          if (state is DailyVerseLoading) {
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          } else if (state is DailyVerseLoaded) {
            return SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: AppTheme.coolGradient,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primaryColor.withValues(alpha: 0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isAm ? 'የዕለቱ  ቃል' : 'Daily Verse',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        state.verse,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Align(
                      //   alignment: Alignment.bottomRight,
                      //   child: Text(
                      //     '- ${state.reference}',
                      //     style: const TextStyle(
                      //       color: Colors.white70,
                      //       fontStyle: FontStyle.italic,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is DailyVerseError) {
            return SliverToBoxAdapter(
              child: Center(child: Text(isAm ? 'የዕለቱ አምላክ ቃል ማግኘት አልተቻለም።' : 'Failed to load daily verse.')),
            );
          } else {
            return const SliverToBoxAdapter();
          }
        },
      ),
          
          //   SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 20),
          //     child: Text(
          //       isAm ? 'የተወደዱ ታሪኮች' : 'Favourite Stories',
          //       style: Theme.of(context).textTheme.headlineMedium,
          //     ),
          //   ),
          // ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          // Favourite Stories
          // BlocBuilder<ProgressBloc, ProgressState>(
          //   builder: (context, state) {
          //     final isAm = settings.languageCode == 'am';

          //     final favoriteStories = state.progress.favoriteStories.isEmpty ? [] : context.read<StoriesBloc>().state.allStories.where((story) =>
          //         state.progress.favoriteStories.contains(story.id)).toList();

          //     if (favoriteStories.isEmpty) {
          //       return SliverToBoxAdapter(
          //         child: Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 20),
          //           child: Text(
          //             isAm ? 'ምንም የተወደደ ታሪክ የለም' : 'No favourite stories yet',
          //             style: Theme.of(context).textTheme.bodyLarge,
          //           ),
          //         ),
          //       );
          //     }

          //     return SliverPadding(
          //       padding: const EdgeInsets.symmetric(horizontal: 20),
          //       sliver: SliverGrid(
          //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 4,
          //           mainAxisSpacing: 8,
          //           crossAxisSpacing: 8,
          //           childAspectRatio: 0.85,
          //         ),
          //         delegate: SliverChildBuilderDelegate(
          //           (context, index) {
          //             final story = favoriteStories[index];
          //             return Padding(
          //               padding: const EdgeInsets.only(bottom: 10),
          //               child: GestureDetector(
          //                 onTap: () {
          //                   Navigator.push(
          //                     context,
          //                     MaterialPageRoute(
          //                       builder: (_) => StoryListScreen(bookEn: story.bookEn, bookAm: story.bookAm),
          //                     ),
          //                   );
          //                 },
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     // Expanded(
          //                     //   child: Container(
          //                     //     decoration: BoxDecoration(
          //                     //       color: AppTheme.primaryColor.withValues(alpha: 0.1),
          //                     //       borderRadius: BorderRadius.circular(20),
          //                     //     ),
          //                     //     child: Center(
          //                     //       child: Icon(
          //                     //         Icons.auto_stories_rounded,
          //                     //         color: AppTheme.primaryColor,
          //                     //         size: 40,
          //                     //       ),
          //                     //     ),
          //                     //   ),
          //                     // ),
          //                     // const SizedBox(height: 8),
          //                     Expanded(child: 
          //                     Container(
          //                       decoration: BoxDecoration(
          //                         color: AppTheme.primaryColor.withValues(alpha: 0.1),
          //                         borderRadius: BorderRadius.circular(50),
          //                       ),
          //                       child: Center(
          //                         child: Text(
          //                           isAm ? story.titleAm : story.titleEn,
          //                           maxLines: 1,
          //                           overflow: TextOverflow.fade,
          //                           style: Theme.of(context).textTheme.titleSmall,
          //                         ),
                                  
          //                       ),
                              
          //                     )
          //                     )
                             
          //                   ],
          //                 ),
          //               ),
          //             );
          //           },
          //           childCount: favoriteStories.length,
          //         ),
          //       ),
          //     );
          //   },
          // ),
          // Book Categories
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                isAm ? 'መጻሕፍት' : 'Books',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          // Book Grid
          BlocBuilder<StoriesBloc, StoriesState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.85,
                  ),
                  delegate: SliverChildListDelegate([
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
                    _BookCard(
                      titleEn: 'Numbers',
                      titleAm: 'ዘኍልቍ',
                      icon: Icons.format_list_numbered_rounded,
                      color: AppTheme.numbersColor,
                      storyCount: _getStoryCount(state.allStories, 'Numbers'),
                      delay: 300,
                    ),
                  ]),
                ),
              );
            },
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],

        
      ),
    
    );

  }

  int _getStoryCount(List<Story> stories, String book) {
    return stories.where((s) => s.bookEn == book).length;
  }

  Widget _buildStreakBadge(BuildContext context) {
    return BlocBuilder<ProgressBloc, ProgressState>(
      builder: (context, state) {
        final streak = state.progress.currentStreak;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            gradient: AppTheme.warmGradient,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppTheme.secondaryColor.withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.local_fire_department, color: Colors.white, size: 20),
              const SizedBox(width: 4),
              Text(
                '$streak',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ).animate().scale(delay: 500.ms, duration: 400.ms);
      },
    );
  }
}

class _BookCard extends StatelessWidget {
  final String titleEn;
  final String titleAm;
  final IconData icon;
  final Color color;
  final int storyCount;
  final int delay;

  const _BookCard({
    required this.titleEn,
    required this.titleAm,
    required this.icon,
    required this.color,
    required this.storyCount,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsBloc>().state;
    final isAm = settings.languageCode == 'am';
    final title = isAm ? titleAm : titleEn;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => StoryListScreen(bookEn: titleEn, bookAm: titleAm),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color, color.withValues(alpha: 0.7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.4),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Background pattern
            Positioned(
              right: -20,
              bottom: -20,
              child: Icon(
                icon,
                size: 100,
                color: Colors.white.withValues(alpha: 0.2),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(icon, color: Colors.white, size: 28),
                  ),
                  const Spacer(),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isAm ? '$storyCount ታሪኮች' : '$storyCount stories',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: Duration(milliseconds: delay)).scale(
          begin: const Offset(0.8, 0.8),
          delay: Duration(milliseconds: delay),
        );
  }
}
