import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  static final TTSService _instance = TTSService._internal();
  factory TTSService() => _instance;
  TTSService._internal();

  final FlutterTts _tts = FlutterTts();
  bool _isInitialized = false;
  bool _isSpeaking = false;

  bool get isSpeaking => _isSpeaking;

  Future<void> init() async {
    if (_isInitialized) return;

    await _tts.setSharedInstance(true);
    await _tts.setSpeechRate(0.45); // Slower for kids
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.1); // Slightly higher pitch for friendliness

    _tts.setStartHandler(() {
      _isSpeaking = true;
    });

    _tts.setCompletionHandler(() {
      _isSpeaking = false;
    });

    _tts.setCancelHandler(() {
      _isSpeaking = false;
    });

    _tts.setErrorHandler((message) {
      _isSpeaking = false;
    });

    _isInitialized = true;
  }

  Future<void> setLanguage(String languageCode) async {
    if (languageCode == 'am') {
      // Check if Amharic is available
      final languages = await _tts.getLanguages;
      final hasAmharic = (languages as List).any(
        (lang) => lang.toString().toLowerCase().contains('am'),
      );
      
      if (hasAmharic) {
        await _tts.setLanguage('am-ET');
      } else {
        // Fallback to English if Amharic not available
        await _tts.setLanguage('en-US');
      }
    } else {
      await _tts.setLanguage('en-US');
    }
  }

  Future<void> setSpeed(double speed) async {
    // Speed: 0.0 to 1.0 (0.45 is good for kids)
    await _tts.setSpeechRate(speed.clamp(0.1, 1.0));
  }

  Future<void> speak(String text) async {
    if (!_isInitialized) await init();
    
    if (_isSpeaking) {
      await stop();
    }

    await _tts.speak(text);
  }

  Future<void> speakWithPauses(List<String> paragraphs) async {
    if (!_isInitialized) await init();

    for (final paragraph in paragraphs) {
      await speak(paragraph);
      // Wait for completion
      while (_isSpeaking) {
        await Future.delayed(const Duration(milliseconds: 100));
      }
      // Pause between paragraphs
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }

  Future<void> pause() async {
    // Note: pause is not supported on all platforms
    // We'll use stop instead
    await _tts.stop();
    _isSpeaking = false;
  }

  Future<void> stop() async {
    await _tts.stop();
    _isSpeaking = false;
  }

  Future<List<String>> getAvailableLanguages() async {
    final languages = await _tts.getLanguages;
    return (languages as List).map((l) => l.toString()).toList();
  }

  void dispose() {
    _tts.stop();
  }
}
