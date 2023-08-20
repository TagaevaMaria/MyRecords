import 'package:hive/hive.dart';

part 'results.g.dart';

@HiveType(typeId: 1)
class Results {
  @HiveField(0)
  String nameTrening;

  @HiveField(1)
  String descriptionTrening;

  @HiveField(2)
  String myRecord;

  Results(
      {required this.nameTrening,
      required this.descriptionTrening,
      required this.myRecord});
}
