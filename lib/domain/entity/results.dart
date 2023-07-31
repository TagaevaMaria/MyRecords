import 'package:hive/hive.dart';

part 'results.g.dart';

@HiveType(typeId: 1)
class Results {
  @HiveField(0)
  String nameTrening;

  Results({required this.nameTrening});
}
