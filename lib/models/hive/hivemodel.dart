import 'package:hive/hive.dart';
part 'hivemodel.g.dart';

@HiveType(typeId: 0)
class SaveToHive {
  @HiveField(0)
  final String course;
  @HiveField(1)
  final double cgpa;
  @HiveField(2)
  final double credits;

  SaveToHive({this.course, this.cgpa, this.credits});
}
