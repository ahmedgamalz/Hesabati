import 'package:flutter/material.dart';
import 'package:hesabati/cubits/add_days_cubit/add_days_cubit.dart';
import 'package:hesabati/cubits/days/days_cubit.dart';
import 'package:hesabati/widgets/add_day_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDay extends StatelessWidget {
  const AddDay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddDaysCubit(),
      child: BlocConsumer<AddDaysCubit, AddDaysState>(
        listener: (context, state) {
          if (state is AddDaysFailure) {}
          if (state is AddDaysSuccess) {
            BlocProvider.of<DaysCubit>(context).fetchAllDays();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
              absorbing: state is AddDaysLoading ? true : false,
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                height: 650,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: 16,
                        left: 16,
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: SingleChildScrollView(
                        child: AddDayForm(
                      title: 'اضافة حسابات يوم',
                    )),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
