import 'package:bloc/bloc.dart';
import 'package:hesabati/constants.dart';
import 'package:hesabati/models/day_model.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'days_state.dart';

class DaysCubit extends Cubit<DaysState> {
  DaysCubit() : super(DaysInitial());
  List<DayModel>? days;
  fetchAllDays() {
    var daysBox = Hive.box<DayModel>(kDaysBox);
    days = daysBox.values.toList();
    emit(DaysSuccess());
  }
}
