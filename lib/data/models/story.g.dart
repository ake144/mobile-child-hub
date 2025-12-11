// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StoryAdapter extends TypeAdapter<Story> {
  @override
  final int typeId = 0;

  @override
  Story read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Story(
      id: fields[0] as String,
      titleEn: fields[1] as String,
      titleAm: fields[2] as String,
      contentEn: fields[3] as String,
      contentAm: fields[4] as String,
      bookEn: fields[5] as String,
      bookAm: fields[6] as String,
      character: fields[7] as String,
      imagePath: fields[8] as String,
      order: fields[9] as int,
      verseReferences: (fields[10] as List).cast<String>(),
      summaryEn: fields[11] as String,
      summaryAm: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Story obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.titleEn)
      ..writeByte(2)
      ..write(obj.titleAm)
      ..writeByte(3)
      ..write(obj.contentEn)
      ..writeByte(4)
      ..write(obj.contentAm)
      ..writeByte(5)
      ..write(obj.bookEn)
      ..writeByte(6)
      ..write(obj.bookAm)
      ..writeByte(7)
      ..write(obj.character)
      ..writeByte(8)
      ..write(obj.imagePath)
      ..writeByte(9)
      ..write(obj.order)
      ..writeByte(10)
      ..write(obj.verseReferences)
      ..writeByte(11)
      ..write(obj.summaryEn)
      ..writeByte(12)
      ..write(obj.summaryAm);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
