import 'package:hive/hive.dart';

import 'hive_cart_model.dart';

class HiveCartAdapter extends TypeAdapter<HiveCartModel> {
  @override
  HiveCartModel read(BinaryReader reader) {
    final title = reader.read() as String;
    final imageUrl = reader.read() as String;
    final price = reader.read() as String;
    final count = reader.read() as String;
    final id = reader.read() as String;

    return HiveCartModel(
        title: title, imageUrl: imageUrl, price: price, count: count, id: id);
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, HiveCartModel obj) {
    writer.write(obj.title);
    writer.write(obj.imageUrl);
    writer.write(obj.price);
    writer.write(obj.count);
    writer.write(obj.id);
  }
}
