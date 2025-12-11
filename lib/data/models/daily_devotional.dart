import 'package:hive/hive.dart';

part 'daily_devotional.g.dart';

@HiveType(typeId: 3)
class DailyDevotional extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String verseEn;

  @HiveField(2)
  final String verseAm;

  @HiveField(3)
  final String referenceEn;

  @HiveField(4)
  final String referenceAm;

  @HiveField(5)
  final String reflectionEn;

  @HiveField(6)
  final String reflectionAm;

  @HiveField(7)
  final String prayerEn;

  @HiveField(8)
  final String prayerAm;

  @HiveField(9)
  final int dayOfYear; // 1-365

  DailyDevotional({
    required this.id,
    required this.verseEn,
    required this.verseAm,
    required this.referenceEn,
    required this.referenceAm,
    required this.reflectionEn,
    required this.reflectionAm,
    required this.prayerEn,
    required this.prayerAm,
    required this.dayOfYear,
  });

  String getVerse(String locale) => locale == 'am' ? verseAm : verseEn;
  String getReference(String locale) => locale == 'am' ? referenceAm : referenceEn;
  String getReflection(String locale) => locale == 'am' ? reflectionAm : reflectionEn;
  String getPrayer(String locale) => locale == 'am' ? prayerAm : prayerEn;
}
