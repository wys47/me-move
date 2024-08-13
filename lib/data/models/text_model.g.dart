// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TextModelAdapter extends TypeAdapter<TextModel> {
  @override
  final int typeId = 1;

  @override
  TextModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TextModel(
      content: fields[0] as String,
      size: fields[1] as double,
      isChangeColor: fields[2] as bool,
      isStrikethrough: fields[3] as bool,
      isBold: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TextModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.content)
      ..writeByte(1)
      ..write(obj.size)
      ..writeByte(2)
      ..write(obj.isChangeColor)
      ..writeByte(3)
      ..write(obj.isStrikethrough)
      ..writeByte(4)
      ..write(obj.isBold);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TextModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
