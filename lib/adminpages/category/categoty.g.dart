// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoty.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Category1Adapter extends TypeAdapter<Category1> {
  @override
  final int typeId = 15;

  @override
  Category1 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Category1(
      catimage: fields[0] as String,
      categoryname: fields[1] as String,
      id: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Category1 obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.catimage)
      ..writeByte(1)
      ..write(obj.categoryname)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category1Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
