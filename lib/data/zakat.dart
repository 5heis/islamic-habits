import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Zakat extends HiveObject {
  @HiveField(0)
  late double amount;

  @HiveField(1)
  late DateTime date;

  Zakat({required this.amount, required this.date});
}

class ZakatAdapter extends TypeAdapter<Zakat> {
  @override
  final int typeId = 0;

  @override
  Zakat read(BinaryReader reader) {
    return Zakat(
      amount: reader.readDouble(),
      date: DateTime.parse(reader.readString()),
    );
  }

  @override
  void write(BinaryWriter writer, Zakat obj) {
    writer.writeDouble(obj.amount);
    writer.writeString(obj.date.toIso8601String());
  }
}
