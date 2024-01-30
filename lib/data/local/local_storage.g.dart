// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_storage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataStorageAdapter extends TypeAdapter<DataStorage> {
  @override
  final int typeId = 0;

  @override
  DataStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataStorage(
      nama: fields[0] as String,
      ttl: fields[1] as String,
      provinsi: fields[2] as String,
      kabupaten: fields[3] as String,
      pekerjaan: fields[4] as String,
      pendidikan: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DataStorage obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.nama)
      ..writeByte(1)
      ..write(obj.ttl)
      ..writeByte(2)
      ..write(obj.provinsi)
      ..writeByte(3)
      ..write(obj.kabupaten)
      ..writeByte(4)
      ..write(obj.pekerjaan)
      ..writeByte(5)
      ..write(obj.pendidikan);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
