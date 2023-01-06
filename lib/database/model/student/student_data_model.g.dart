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
      nationality: fields[7] as String,
      gender: fields[8] as String,
      houseName: fields[9] as String,
      postOffice: fields[10] as String,
      place: fields[11] as String,
      password: fields[15] as String,
      fName: fields[1] as String,
      lName: fields[2] as String,
      regNum: fields[3] as String,
      admNum: fields[4] as String,
      dOBirth: fields[5] as String,
      dept: fields[6] as String,
      eMail: fields[12] as String,
      mobNum: fields[14] as String,
      guardianName: fields[13] as String,
      grades: fields[16] as GradesModel?,
    )..id = fields[0] as int?;
  }

  @override
  void write(BinaryWriter writer, StudentModel obj) {
    writer
      ..writeByte(17)
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
      ..write(obj.nationality)
      ..writeByte(8)
      ..write(obj.gender)
      ..writeByte(9)
      ..write(obj.houseName)
      ..writeByte(10)
      ..write(obj.postOffice)
      ..writeByte(11)
      ..write(obj.place)
      ..writeByte(12)
      ..write(obj.eMail)
      ..writeByte(13)
      ..write(obj.guardianName)
      ..writeByte(14)
      ..write(obj.mobNum)
      ..writeByte(15)
      ..write(obj.password)
      ..writeByte(16)
      ..write(obj.grades);
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
