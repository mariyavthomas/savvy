// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderhistoryModelAdapter extends TypeAdapter<OrderhistoryModel> {
  @override
  final int typeId = 12;

  @override
  OrderhistoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderhistoryModel(
      pincode: fields[5] as String?,
      usrname: fields[6] as String?,
      image: fields[1] as String,
      productname: fields[2] as String,
      price: fields[3] as num,
      decripation: fields[7] as String,
      id: fields[0] as int?,
      quantity: fields[4] as double?,
      dis: fields[10] as String,
      housename: fields[8] as String,
      mail: fields[12] as String,
      mobile: fields[11] as String,
      post: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OrderhistoryModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.productname)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.quantity)
      ..writeByte(5)
      ..write(obj.pincode)
      ..writeByte(6)
      ..write(obj.usrname)
      ..writeByte(7)
      ..write(obj.decripation)
      ..writeByte(8)
      ..write(obj.housename)
      ..writeByte(9)
      ..write(obj.post)
      ..writeByte(10)
      ..write(obj.dis)
      ..writeByte(11)
      ..write(obj.mobile)
      ..writeByte(12)
      ..write(obj.mail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderhistoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
