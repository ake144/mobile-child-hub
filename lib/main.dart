import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'services/hive_service.dart';
import 'services/tts_service.dart';
import 'services/audio_service.dart';
import 'presentation/blocs/settings_bloc.dart';
import 'presentation/blocs/progress_bloc.dart';
import 'presentation/blocs/stories_bloc.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive for offline storage
  await HiveService.init();
  
  // Initialize audio services
  await TTSService().init();
  await AudioService().init();
  
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SettingsBloc()..add(LoadSettings())),
        BlocProvider(create: (_) => ProgressBloc()..add(LoadProgress())),
        BlocProvider(create: (_) => StoriesBloc()..add(LoadStories())),
      ],
      child: const BibleStoriesApp(),
    ),
  );
}
