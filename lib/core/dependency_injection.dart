import 'package:bible_stories/core/network/dio_client.dart';
import 'package:bible_stories/data/datasources/daily_verse_remote_db.dart';
import 'package:bible_stories/presentation/blocs/daily_verse_bloc.dart';
import 'package:bible_stories/presentation/blocs/progress_bloc.dart';
import 'package:bible_stories/presentation/blocs/stories_bloc.dart';
import 'package:bible_stories/services/hive_service.dart';
import 'package:get_it/get_it.dart';



final sl = GetIt.instance;



Future<void>  setupInjector() async {


sl.registerLazySingleton<DioClient>(() => DioClient());


sl.registerLazySingleton<HiveService>(()=>HiveService()); 


sl.registerLazySingleton<DailyVerseRemoteDb>(
    () => DailyVerseRemoteDb(dioClient: sl<DioClient>()));  


sl.registerFactory<DailyVerseBloc>(
    () => DailyVerseBloc(dailyVerseRemoteDb: sl<DailyVerseRemoteDb>()));
  

  sl.registerFactory<ProgressBloc>(
    ()  => ProgressBloc());


  sl.registerFactory<StoriesBloc>(
    () => StoriesBloc(sl<HiveService>())
    );
  


 





  // Register other dependencies here
  // Example: sl.registerLazySingleton<SomeService>(() => SomeServiceImpl());
  
  // If you have any initial setup or configuration, do it here
  // Example: await sl<SomeService>().initialize();


}