
import 'package:bible_stories/data/datasources/daily_verse_remote_db.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


//events for daily verse feature
abstract class DailyVerseEvent extends Equatable {
  const DailyVerseEvent();

  @override
  List<Object?> get props => [];
}

class FetchDailyVerseEvent extends DailyVerseEvent {     
}





//state management for daily verse feature

class DailyVerseState extends Equatable {
    final String verse;
    final String? message;
    final bool isLoading;


  const DailyVerseState({this.verse = "", this.message, this.isLoading = false});

   DailyVerseState copyWith({
    String? verse,
    String? message,
    bool? isLoading,
  }) {
    return DailyVerseState(
      verse: verse ?? this.verse,
      message: message ?? this.message,
      isLoading: isLoading ?? this.isLoading,
    );
  }


  @override
  List<Object?> get props => [verse, message, isLoading];
}

class DailyVerseLoading extends DailyVerseState {
  const DailyVerseLoading() : super(isLoading: true);
}

class DailyVerseLoaded extends DailyVerseState {
  const DailyVerseLoaded({required String verse})
      : super(verse: verse, isLoading: false);
}

class DailyVerseError extends DailyVerseState {
  const DailyVerseError({required String message})
      : super(message: message, isLoading: false);
}




//Bloc for Daily Verse

class DailyVerseBloc extends Bloc<DailyVerseEvent, DailyVerseState> {
  final DailyVerseRemoteDb dailyVerseRemoteDb;

  DailyVerseBloc({required this.dailyVerseRemoteDb}) : super(const DailyVerseState()) {
    on<FetchDailyVerseEvent>(_onFetchDailyVerse);
  }
  Future<void> _onFetchDailyVerse(
      FetchDailyVerseEvent event, Emitter<DailyVerseState> emit) async {
    emit(DailyVerseLoading());
    try {
      // USE DI: We use the instance passed in the constructor
      final dailyVerse = await dailyVerseRemoteDb.fetchDailyVerse();


      emit(DailyVerseLoaded(verse: dailyVerse.verse));
    } catch (e) {
      emit(DailyVerseError(message: e.toString()));
    }
  }
  }
