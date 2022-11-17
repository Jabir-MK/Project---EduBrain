// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentModelAdapter extends TypeAdapter<StudentModel> {
  @override
  final int typeId = 1;

  @override
  StudentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentModel(
      fName: fields[1] as String,
      lName: fields[2] as String,
      regNum: fields[3] as String,
      admNum: fields[4] as String,
      dOBirth: fields[5] as String,
      dept: fields[6] as String,
      eMail: fields[7] as String,
      mobNum: fields[8] as String,
      guardianName: fields[9] as String,
    )..id = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, StudentModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fName)
      ..writeByte(2)
      ..write(obj.lName)
      ..writeByte(3)
      ..write(obj.regNum)
      ..writeByte(4)
      ..write(obj.admNum)
      ..writeByte(5)
      ..write(obj.dOBirth)
      ..writeByte(6)
      ..write(obj.dept)
      ..writeByte(7)
      ..write(obj.eMail)
      ..writeByte(8)
      ..write(obj.mobNum)
      ..writeByte(9)
      ..write(obj.guardianName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
