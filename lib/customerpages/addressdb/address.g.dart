// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressAdapter extends TypeAdapter<Address> {
  @override
  final int typeId = 4;

  @override
  Address read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Address(
      addname: fields[0] as String,
      housename: fields[1] as String,
      pincode: fields[2] as String,
      post: fields[3] as String,
      number: fields[6] as String,
      mail: fields[7] as String,
      dis: fields[4] as String,
      id: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Address obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.addname)
      ..writeByte(1)
      ..write(obj.housename)
      ..writeByte(2)
      ..write(obj.pincode)
      ..writeByte(3)
      ..write(obj.post)
      ..writeByte(4)
      ..write(obj.dis)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.number)
      ..writeByte(7)
      ..write(obj.mail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
