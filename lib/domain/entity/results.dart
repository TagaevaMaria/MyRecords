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

  @HiveField(3)
  String dateTrening;

  Results(
      {required this.nameTrening,
      required this.descriptionTrening,
      required this.myRecord,
      required this.dateTrening});
}
