import 'package:bible_stories/presentation/blocs/daily_verse_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'services/hive_service.dart';
import 'services/tts_service.dart';
import 'services/audio_service.dart';
import 'presentation/blocs/settings_bloc.dart';
import 'presentation/blocs/progress_bloc.dart';
import 'presentation/blocs/stories_bloc.dart';
import 'app.dart';

import 'core/dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  
  await di.setupInjector();


  await HiveService.init();
  

  await TTSService().init();
  await AudioService().init();
  
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SettingsBloc()..add(LoadSettings())),
        BlocProvider(create: (_) => ProgressBloc()..add(LoadProgress())),
        BlocProvider(create: (_) => di.sl<StoriesBloc>()..add(LoadStories())),
        BlocProvider(create: (_)=> di.sl<DailyVerseBloc>()..add(FetchDailyVerseEvent())),
      ],
      child: const BibleStoriesApp(),
    ),
  );
}
