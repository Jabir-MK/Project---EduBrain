// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grades_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GradesModelAdapter extends TypeAdapter<GradesModel> {
  @override
  final int typeId = 4;

  @override
  GradesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GradesModel(
      englishMark: fields[1] as String,
      mathematicsMark: fields[2] as String,
      languageMark: fields[3] as String,
      chemistryMark: fields[4] as String,
      physicsMark: fields[5] as String,
      computerMark: fields[6] as String,
    )..id = fields[0] as int?;
  }

  @override
  void write(BinaryWriter writer, GradesModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.englishMark)
      ..writeByte(2)
      ..write(obj.mathematicsMark)
      ..writeByte(3)
      ..write(obj.languageMark)
      ..writeByte(4)
      ..write(obj.chemistryMark)
      ..writeByte(5)
      ..write(obj.physicsMark)
      ..writeByte(6)
      ..write(obj.computerMark);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GradesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
