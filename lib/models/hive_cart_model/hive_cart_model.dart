import 'package:hive/hive.dart';

class HiveCartModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(0)
  String imageUrl;
  @HiveField(0)
  String price;
  @HiveField(0)
  String count;
  @HiveField(0)
  String id;

  HiveCartModel({
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.count,
    required this.id,
  });
}
