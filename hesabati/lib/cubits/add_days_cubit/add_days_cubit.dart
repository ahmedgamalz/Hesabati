import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hesabati/constants.dart';
import 'package:hesabati/models/day_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'add_days_state.dart';

class AddDaysCubit extends Cubit<AddDaysState> {
  AddDaysCubit() : super(AddDaysInitial());
  addDays(DayModel day) async {
    emit(AddDaysLoading());
    try {
      var daysBox = Hive.box<DayModel>(kDaysBox);
      await daysBox.add(day);
      emit(AddDaysSuccess());
    } catch (e) {
      AddDaysFailure(e.toString());
    }
  }
}
