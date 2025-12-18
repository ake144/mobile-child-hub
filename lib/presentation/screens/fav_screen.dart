

import 'package:bible_stories/core/theme/app_theme.dart';
import 'package:bible_stories/presentation/blocs/progress_bloc.dart';
import 'package:bible_stories/presentation/blocs/settings_bloc.dart';
import 'package:bible_stories/presentation/blocs/stories_bloc.dart';
import 'package:bible_stories/presentation/screens/story_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteStories extends StatelessWidget {
  const FavoriteStories({super.key});

  @override
  Widget build(BuildContext context) {
    final setting  = context.watch<SettingsBloc>().state;
    
    final isAm = setting.languageCode == 'am';


    return Scaffold(
      appBar: AppBar(
        title: Text(isAm ? 'የተወደዱ ታሪኮች' : 'Favorite Stories',
          style: Theme.of(context).textTheme.headlineMedium,
         ),
        backgroundColor: AppTheme.primaryColor,
      ),
      body:  _FavoriteStoriesList(),
    );
  }
}


class _FavoriteStoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final setting = context.watch<SettingsBloc>().state;
      final isAm = setting.languageCode == 'am';

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: const SizedBox(height: 40)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:30),
              child: Text(
                isAm ? 'የተወደዱ ታሪኮች ዝርዝር' : 'List of Favorite Stories',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).textTheme.headlineMedium?.color?.withValues(alpha: 0.8),
                ),
              ),
            ).animate().fadeIn(),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 25)),
          
          BlocBuilder<ProgressBloc, ProgressState>(
            builder: (context, state) {
              if (state.progress.favoriteStories.isEmpty) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(isAm ? 'እርግጠኛ የተወደዱ ታሪኮች አልተመዘገቡም።' : 'No favorite stories found.'),
                  ),
                );
              }

              final favoriteStories = context.read<StoriesBloc>().state.allStories.where(
                (story) => state.progress.favoriteStories.contains(story.id)
              ).toList();

              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      mainAxisExtent: 220,
                    ),
                   delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final story = favoriteStories[index];
                        return Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(24),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(24),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => StoryListScreen(bookEn: story.bookEn, bookAm: story.bookAm),
                                ),
                              );
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                gradient: LinearGradient(
                                  colors: [
                                    AppTheme.primaryColor.withValues(alpha: 0.10),
                                    AppTheme.primaryColor.withValues(alpha: 0.18),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                border: Border.all(
                                  color: AppTheme.primaryColor.withValues(alpha: 0.22),
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppTheme.primaryColor.withValues(alpha: 0.14),
                                    blurRadius: 12,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: AppTheme.primaryColor.withValues(alpha: 0.15),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: const Icon(
                                            Icons.auto_stories_rounded,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          splashRadius: 18,
                                          tooltip: isAm ? 'ከወደዱ ይወግዱ' : 'Remove favorite',
                                          icon: Icon(
                                            Icons.favorite,
                                            color: AppTheme.primaryColor,
                                            size: 20,
                                          ),
                                          onPressed: () {
                                            context.read<ProgressBloc>().add(ToggleFavorite(story.id));
                                          },
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      isAm ? story.titleAm : story.titleEn,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      isAm ? story.summaryAm : story.summaryEn,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.color
                                                ?.withValues(alpha: 0.85),
                                          ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: AppTheme.primaryColor.withValues(alpha: 0.12),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Text(
                                        isAm ? story.bookAm : story.bookEn,
                                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ).animate().fadeIn().scale(begin: const Offset(0.98, 0.98));
                      },
                      childCount: favoriteStories.length,
                   ),  
                    )
              );
            },
          ),
        ],
      ), 
    
    );
}
}