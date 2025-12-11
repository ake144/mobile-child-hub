// App Settings BLoC - Handles language, theme, audio settings

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/hive_service.dart';

// Events
abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
  @override
  List<Object?> get props => [];
}

class LoadSettings extends SettingsEvent {}

class ChangeLanguage extends SettingsEvent {
  final String languageCode;
  const ChangeLanguage(this.languageCode);
  @override
  List<Object?> get props => [languageCode];
}

class ToggleDarkMode extends SettingsEvent {}

class ToggleSound extends SettingsEvent {}

class ToggleTTS extends SettingsEvent {}

class ChangeTTSSpeed extends SettingsEvent {
  final double speed;
  const ChangeTTSSpeed(this.speed);
  @override
  List<Object?> get props => [speed];
}

// State
class SettingsState extends Equatable {
  final String languageCode;
  final bool isDarkMode;
  final bool isSoundEnabled;
  final bool isTTSEnabled;
  final double ttsSpeed;
  final bool isLoading;

  const SettingsState({
    this.languageCode = 'en',
    this.isDarkMode = false,
    this.isSoundEnabled = true,
    this.isTTSEnabled = true,
    this.ttsSpeed = 0.5,
    this.isLoading = true,
  });

  SettingsState copyWith({
    String? languageCode,
    bool? isDarkMode,
    bool? isSoundEnabled,
    bool? isTTSEnabled,
    double? ttsSpeed,
    bool? isLoading,
  }) {
    return SettingsState(
      languageCode: languageCode ?? this.languageCode,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isSoundEnabled: isSoundEnabled ?? this.isSoundEnabled,
      isTTSEnabled: isTTSEnabled ?? this.isTTSEnabled,
      ttsSpeed: ttsSpeed ?? this.ttsSpeed,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        languageCode,
        isDarkMode,
        isSoundEnabled,
        isTTSEnabled,
        ttsSpeed,
        isLoading,
      ];
}

// BLoC
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<LoadSettings>(_onLoadSettings);
    on<ChangeLanguage>(_onChangeLanguage);
    on<ToggleDarkMode>(_onToggleDarkMode);
    on<ToggleSound>(_onToggleSound);
    on<ToggleTTS>(_onToggleTTS);
    on<ChangeTTSSpeed>(_onChangeTTSSpeed);
  }

  Future<void> _onLoadSettings(
    LoadSettings event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(
      languageCode: HiveService.getLanguage(),
      isDarkMode: HiveService.isDarkMode(),
      isSoundEnabled: HiveService.isSoundEnabled(),
      isTTSEnabled: HiveService.isTTSEnabled(),
      ttsSpeed: HiveService.getTTSSpeed(),
      isLoading: false,
    ));
  }

  Future<void> _onChangeLanguage(
    ChangeLanguage event,
    Emitter<SettingsState> emit,
  ) async {
    await HiveService.setLanguage(event.languageCode);
    emit(state.copyWith(languageCode: event.languageCode));
  }

  Future<void> _onToggleDarkMode(
    ToggleDarkMode event,
    Emitter<SettingsState> emit,
  ) async {
    final newValue = !state.isDarkMode;
    await HiveService.setDarkMode(newValue);
    emit(state.copyWith(isDarkMode: newValue));
  }

  Future<void> _onToggleSound(
    ToggleSound event,
    Emitter<SettingsState> emit,
  ) async {
    final newValue = !state.isSoundEnabled;
    await HiveService.setSoundEnabled(newValue);
    emit(state.copyWith(isSoundEnabled: newValue));
  }

  Future<void> _onToggleTTS(
    ToggleTTS event,
    Emitter<SettingsState> emit,
  ) async {
    final newValue = !state.isTTSEnabled;
    await HiveService.setTTSEnabled(newValue);
    emit(state.copyWith(isTTSEnabled: newValue));
  }

  Future<void> _onChangeTTSSpeed(
    ChangeTTSSpeed event,
    Emitter<SettingsState> emit,
  ) async {
    await HiveService.setTTSSpeed(event.speed);
    emit(state.copyWith(ttsSpeed: event.speed));
  }
}
