import 'package:bible_stories/core/network/dio_client.dart';
import 'package:bible_stories/data/models/daily_verse.dart';

class DailyVerseRemoteDb {
  final DioClient dioClient;

  DailyVerseRemoteDb({required this.dioClient});

  Future<DailyVerse> fetchDailyVerse() async {
          try{
            final Response = await dioClient.dio.get('');

            if (Response.statusCode == 200) {
              return DailyVerse(verse: Response.toString());
            } else {
              throw Exception('Failed to load daily verse');
            }       
          }
          catch (e) {
            throw Exception('Failed to load daily verse: $e');
          }

  }

}