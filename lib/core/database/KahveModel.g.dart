// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'KahveModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KahveModelAdapter extends TypeAdapter<KahveModel> {
  @override
  final int typeId = 1;

  @override
  KahveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KahveModel()
      ..id = fields[0] as int?
      ..isim = fields[1] as int?
      ..aciklama = fields[2] as String?
      ..resim = fields[3] as String?
      ..fiyat = fields[4] as double?
      ..bgcolor = fields[5] as Color?;
  }

  @override
  void write(BinaryWriter writer, KahveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.isim)
      ..writeByte(2)
      ..write(obj.aciklama)
      ..writeByte(3)
      ..write(obj.resim)
      ..writeByte(4)
      ..write(obj.fiyat)
      ..writeByte(5)
      ..write(obj.bgcolor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KahveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
