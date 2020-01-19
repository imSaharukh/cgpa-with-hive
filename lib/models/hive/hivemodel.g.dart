// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hivemodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaveToHiveAdapter extends TypeAdapter<SaveToHive> {
  @override
  final typeId = 0;

  @override
  SaveToHive read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaveToHive(
      course: fields[0] as String,
      cgpa: fields[1] as double,
      credits: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, SaveToHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.course)
      ..writeByte(1)
      ..write(obj.cgpa)
      ..writeByte(2)
      ..write(obj.credits);
  }
}
