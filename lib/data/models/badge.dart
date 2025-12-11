import 'package:hive/hive.dart';

part 'badge.g.dart';

@HiveType(typeId: 4)
class Badge extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String nameEn;

  @HiveField(2)
  final String nameAm;

  @HiveField(3)
  final String descriptionEn;

  @HiveField(4)
  final String descriptionAm;

  @HiveField(5)
  final String iconPath;

  @HiveField(6)
  final String requirement; // e.g., "complete_genesis", "streak_7"

  @HiveField(7)
  final int requiredValue;

  Badge({
    required this.id,
    required this.nameEn,
    required this.nameAm,
    required this.descriptionEn,
    required this.descriptionAm,
    required this.iconPath,
    required this.requirement,
    required this.requiredValue,
  });

  String getName(String locale) => locale == 'am' ? nameAm : nameEn;
  String getDescription(String locale) => locale == 'am' ? descriptionAm : descriptionEn;
}
