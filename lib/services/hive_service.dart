import 'package:hive/hive.dart';

sealed class HiveService {
  static var myCart = Hive.box('myCart');
}
