part of 'add_days_cubit.dart';

@immutable
sealed class AddDaysState {}

final class AddDaysInitial extends AddDaysState {}

final class AddDaysLoading extends AddDaysState {}

final class AddDaysSuccess extends AddDaysState {}

final class AddDaysFailure extends AddDaysState {
  final String errorMessage;

  AddDaysFailure(this.errorMessage);
}
