// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayAdapter extends TypeAdapter<DayModel> {
  @override
  final int typeId = 0;

  @override
  DayModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DayModel(
      day: fields[0] as String,
      date: fields[1] as dynamic,
      dailyExpenses: fields[2] as int,
      totalRevenue: fields[3] as int,
      purchases: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DayModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.dailyExpenses)
      ..writeByte(3)
      ..write(obj.totalRevenue)
      ..writeByte(4)
      ..write(obj.netRevenue)
      ..writeByte(5)
      ..write(obj.purchases);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
