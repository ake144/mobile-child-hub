import 'package:audioplayers/audioplayers.dart';

class AudioService {
  static final AudioService _instance = AudioService._internal();
  factory AudioService() => _instance;
  AudioService._internal();

  final AudioPlayer _bgMusicPlayer = AudioPlayer();
  final AudioPlayer _sfxPlayer = AudioPlayer();
  
  bool _isMusicEnabled = true;
  bool _isSfxEnabled = true;
  double _musicVolume = 0.3;
  double _sfxVolume = 0.7;

  // Sound effect paths
  static const String sfxCorrect = 'audio/correct.mp3';
  static const String sfxWrong = 'audio/wrong.mp3';
  static const String sfxLevelUp = 'audio/level_up.mp3';
  static const String sfxBadge = 'audio/badge_earned.mp3';
  static const String sfxClick = 'audio/click.mp3';
  static const String sfxPageTurn = 'audio/page_turn.mp3';
  static const String sfxCelebration = 'audio/celebration.mp3';

  // Background music paths
  static const String bgMusicGentle = 'audio/bg_gentle.mp3';
  static const String bgMusicAdventure = 'audio/bg_adventure.mp3';

  Future<void> init() async {
    await _bgMusicPlayer.setReleaseMode(ReleaseMode.loop);
    await _bgMusicPlayer.setVolume(_musicVolume);
    await _sfxPlayer.setVolume(_sfxVolume);
  }

  // Background Music Controls
  Future<void> playBackgroundMusic([String? path]) async {
    if (!_isMusicEnabled) return;
    
    final musicPath = path ?? bgMusicGentle;
    await _bgMusicPlayer.play(AssetSource(musicPath));
  }

  Future<void> stopBackgroundMusic() async {
    await _bgMusicPlayer.stop();
  }

  Future<void> pauseBackgroundMusic() async {
    await _bgMusicPlayer.pause();
  }

  Future<void> resumeBackgroundMusic() async {
    if (!_isMusicEnabled) return;
    await _bgMusicPlayer.resume();
  }

  Future<void> setMusicVolume(double volume) async {
    _musicVolume = volume.clamp(0.0, 1.0);
    await _bgMusicPlayer.setVolume(_musicVolume);
  }

  // Sound Effects
  Future<void> playSFX(String path) async {
    if (!_isSfxEnabled) return;
    await _sfxPlayer.play(AssetSource(path));
  }

  Future<void> playCorrectSound() async {
    await playSFX(sfxCorrect);
  }

  Future<void> playWrongSound() async {
    await playSFX(sfxWrong);
  }

  Future<void> playLevelUpSound() async {
    await playSFX(sfxLevelUp);
  }

  Future<void> playBadgeSound() async {
    await playSFX(sfxBadge);
  }

  Future<void> playClickSound() async {
    await playSFX(sfxClick);
  }

  Future<void> playPageTurnSound() async {
    await playSFX(sfxPageTurn);
  }

  Future<void> playCelebrationSound() async {
    await playSFX(sfxCelebration);
  }

  Future<void> setSfxVolume(double volume) async {
    _sfxVolume = volume.clamp(0.0, 1.0);
    await _sfxPlayer.setVolume(_sfxVolume);
  }

  // Enable/Disable
  void setMusicEnabled(bool enabled) {
    _isMusicEnabled = enabled;
    if (!enabled) {
      stopBackgroundMusic();
    }
  }

  void setSfxEnabled(bool enabled) {
    _isSfxEnabled = enabled;
  }

  bool get isMusicEnabled => _isMusicEnabled;
  bool get isSfxEnabled => _isSfxEnabled;
  double get musicVolume => _musicVolume;
  double get sfxVolume => _sfxVolume;

  void dispose() {
    _bgMusicPlayer.dispose();
    _sfxPlayer.dispose();
  }
}
