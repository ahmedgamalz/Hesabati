import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesabati/cubits/days/days_cubit.dart';
import 'package:hesabati/models/day_model.dart';
import 'package:hesabati/widgets/dayItem.dart';

class DayLIstView extends StatelessWidget {
  const DayLIstView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DaysCubit, DaysState>(
      builder: (context, state) {
        List<DayModel> days = BlocProvider.of<DaysCubit>(context).days!;
        return ListView.builder(
          shrinkWrap: true,
          itemCount: days.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: DayItem(
                day: days[index],
              ),
            );
          },
        );
      },
    );
  }
}
