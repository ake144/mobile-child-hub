// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_devotional.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyDevotionalAdapter extends TypeAdapter<DailyDevotional> {
  @override
  final int typeId = 3;

  @override
  DailyDevotional read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyDevotional(
      id: fields[0] as String,
      verseEn: fields[1] as String,
      verseAm: fields[2] as String,
      referenceEn: fields[3] as String,
      referenceAm: fields[4] as String,
      reflectionEn: fields[5] as String,
      reflectionAm: fields[6] as String,
      prayerEn: fields[7] as String,
      prayerAm: fields[8] as String,
      dayOfYear: fields[9] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DailyDevotional obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.verseEn)
      ..writeByte(2)
      ..write(obj.verseAm)
      ..writeByte(3)
      ..write(obj.referenceEn)
      ..writeByte(4)
      ..write(obj.referenceAm)
      ..writeByte(5)
      ..write(obj.reflectionEn)
      ..writeByte(6)
      ..write(obj.reflectionAm)
      ..writeByte(7)
      ..write(obj.prayerEn)
      ..writeByte(8)
      ..write(obj.prayerAm)
      ..writeByte(9)
      ..write(obj.dayOfYear);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyDevotionalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
