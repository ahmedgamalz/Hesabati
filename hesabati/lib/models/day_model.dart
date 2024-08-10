import 'package:hive/hive.dart';

part 'day_model.g.dart';

@HiveType(typeId: 0)
class DayModel extends HiveObject {
  @HiveField(0)
  String day;
  @HiveField(1)
  dynamic date;
  @HiveField(2)
  int dailyExpenses;
  @HiveField(3)
  int totalRevenue;
  @HiveField(4)
  int get netRevenue => totalRevenue - (dailyExpenses + purchases);
  @HiveField(5)
  int purchases;

  DayModel(
      {required this.day,
      required this.date,
      required this.dailyExpenses,
      required this.totalRevenue,
      required this.purchases});
}
