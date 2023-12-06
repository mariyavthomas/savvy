// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gromming.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GrommingAdapter extends TypeAdapter<Gromming> {
  @override
  final int typeId = 3;

  @override
  Gromming read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Gromming(
      time: fields[5] as String?,
      grommingname: fields[0] as String,
      functionality: fields[1] as String,
      price: fields[2] as String,
      image: fields[3] as String,
      id: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Gromming obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.grommingname)
      ..writeByte(1)
      ..write(obj.functionality)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GrommingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
