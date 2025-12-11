// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuizAdapter extends TypeAdapter<Quiz> {
  @override
  final int typeId = 1;

  @override
  Quiz read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Quiz(
      id: fields[0] as String,
      storyId: fields[1] as String,
      questionEn: fields[2] as String,
      questionAm: fields[3] as String,
      optionsEn: (fields[4] as List).cast<String>(),
      optionsAm: (fields[5] as List).cast<String>(),
      correctIndex: fields[6] as int,
      points: fields[7] as int,
      hintEn: fields[8] as String?,
      hintAm: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Quiz obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.storyId)
      ..writeByte(2)
      ..write(obj.questionEn)
      ..writeByte(3)
      ..write(obj.questionAm)
      ..writeByte(4)
      ..write(obj.optionsEn)
      ..writeByte(5)
      ..write(obj.optionsAm)
      ..writeByte(6)
      ..write(obj.correctIndex)
      ..writeByte(7)
      ..write(obj.points)
      ..writeByte(8)
      ..write(obj.hintEn)
      ..writeByte(9)
      ..write(obj.hintAm);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
