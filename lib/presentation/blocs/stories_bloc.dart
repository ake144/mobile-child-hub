// Stories BLoC - Handles loading and filtering stories

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/story.dart';
import '../../services/hive_service.dart';
import '../../data/datasources/story_data.dart';

// Events
abstract class StoriesEvent extends Equatable {
  const StoriesEvent();
  @override
  List<Object?> get props => [];
}

class LoadStories extends StoriesEvent {}

class FilterByBook extends StoriesEvent {
  final String? bookEn;
  const FilterByBook(this.bookEn);
  @override
  List<Object?> get props => [bookEn];
}

class SearchStories extends StoriesEvent {
  final String query;
  const SearchStories(this.query);
  @override
  List<Object?> get props => [query];
}

// State
class StoriesState extends Equatable {
  final List<Story> allStories;
  final List<Story> filteredStories;
  final String? currentBook;
  final String searchQuery;
  final bool isLoading;
  final String? error;

  const StoriesState({
    this.allStories = const [],
    this.filteredStories = const [],
    this.currentBook,
    this.searchQuery = '',
    this.isLoading = true,
    this.error,
  });

  StoriesState copyWith({
    List<Story>? allStories,
    List<Story>? filteredStories,
    String? currentBook,
    String? searchQuery,
    bool? isLoading,
    String? error,
  }) {
    return StoriesState(
      allStories: allStories ?? this.allStories,
      filteredStories: filteredStories ?? this.filteredStories,
      currentBook: currentBook,
      searchQuery: searchQuery ?? this.searchQuery,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  List<String> get uniqueBooks {
    final books = allStories.map((s) => s.bookEn).toSet().toList();
    books.sort((a, b) {
      final order = ['Genesis', 'Exodus', 'Leviticus', 'Numbers'];
      return order.indexOf(a).compareTo(order.indexOf(b));
    });
    return books;
  }

  @override
  List<Object?> get props => [
        allStories,
        filteredStories,
        currentBook,
        searchQuery,
        isLoading,
        error,
      ];
}

// BLoC
class StoriesBloc extends Bloc<StoriesEvent, StoriesState> {
  StoriesBloc() : super(const StoriesState()) {
    on<LoadStories>(_onLoadStories);
    on<FilterByBook>(_onFilterByBook);
    on<SearchStories>(_onSearchStories);
  }

  Future<void> _onLoadStories(
    LoadStories event,
    Emitter<StoriesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      // Check if stories exist in Hive
      var stories = HiveService.getAllStories();

      if (stories.isEmpty) {
        // Initialize with default stories
        stories = StoryData.getAllStories();
        for (final story in stories) {
          await HiveService.saveStory(story);
        }
      }

      emit(state.copyWith(
        allStories: stories,
        filteredStories: stories,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  void _onFilterByBook(
    FilterByBook event,
    Emitter<StoriesState> emit,
  ) {
    if (event.bookEn == null) {
      emit(state.copyWith(
        filteredStories: state.allStories,
        currentBook: null,
      ));
    } else {
      final filtered = state.allStories
          .where((s) => s.bookEn.toLowerCase() == event.bookEn!.toLowerCase())
          .toList()
        ..sort((a, b) => a.order.compareTo(b.order));
      
      emit(state.copyWith(
        filteredStories: filtered,
        currentBook: event.bookEn,
      ));
    }
  }

  void _onSearchStories(
    SearchStories event,
    Emitter<StoriesState> emit,
  ) {
    if (event.query.isEmpty) {
      final filtered = state.currentBook != null
          ? state.allStories
              .where((s) => s.bookEn.toLowerCase() == state.currentBook!.toLowerCase())
              .toList()
          : state.allStories;
      
      emit(state.copyWith(
        filteredStories: filtered,
        searchQuery: '',
      ));
    } else {
      final query = event.query.toLowerCase();
      final filtered = state.allStories.where((s) {
        return s.titleEn.toLowerCase().contains(query) ||
            s.titleAm.contains(query) ||
            s.character.toLowerCase().contains(query);
      }).toList();
      
      emit(state.copyWith(
        filteredStories: filtered,
        searchQuery: event.query,
      ));
    }
  }
}
