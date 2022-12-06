// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeacherModelAdapter extends TypeAdapter<TeacherModel> {
  @override
  final int typeId = 3;

  @override
  TeacherModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TeacherModel(
      teacherRegID: fields[1] as String,
      teacherSubject: fields[2] as String,
      teacherQualification: fields[3] as String,
      teacherGender: fields[4] as String,
      teacherMobileNum: fields[6] as String,
      teacherName: fields[8] as String,
      teacherEMail: fields[5] as String,
      teacherPassword: fields[7] as String,
    )..id = fields[0] as int?;
  }

  @override
  void write(BinaryWriter writer, TeacherModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.teacherName)
      ..writeByte(1)
      ..write(obj.teacherRegID)
      ..writeByte(2)
      ..write(obj.teacherSubject)
      ..writeByte(3)
      ..write(obj.teacherQualification)
      ..writeByte(4)
      ..write(obj.teacherGender)
      ..writeByte(5)
      ..write(obj.teacherEMail)
      ..writeByte(6)
      ..write(obj.teacherMobileNum)
      ..writeByte(7)
      ..write(obj.teacherPassword);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeacherModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
