// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grrombook.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookgromAdapter extends TypeAdapter<Bookgrom> {
  @override
  final int typeId = 16;

  @override
  Bookgrom read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bookgrom(
      imagePath: fields[7] as String,
      number: fields[6] as String,
      grommingname: fields[8] as String,
      id: fields[3] as int,
      breed: fields[0] as String,
      age: fields[4] as String,
      price: fields[9] as String,
      aggressive: fields[2] as String,
      gender: fields[1] as String,
      dateTime: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Bookgrom obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.breed)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.aggressive)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.age)
      ..writeByte(5)
      ..write(obj.dateTime)
      ..writeByte(6)
      ..write(obj.number)
      ..writeByte(7)
      ..write(obj.imagePath)
      ..writeByte(8)
      ..write(obj.grommingname)
      ..writeByte(9)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookgromAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
