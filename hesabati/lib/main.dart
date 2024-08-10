import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesabati/constants.dart';
import 'package:hesabati/cubits/add_days_cubit/add_days_cubit.dart';
import 'package:hesabati/cubits/days/days_cubit.dart';
import 'package:hesabati/models/day_model.dart';
import 'package:hesabati/views/day_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DayAdapter());

  await Hive.openBox<DayModel>(kDaysBox);

  runApp(const Hesabati());
}

class Hesabati extends StatelessWidget {
  const Hesabati({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AddDaysCubit()),
        BlocProvider(create: (_) => DaysCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Zain'),
        home: DayView(),
      ),
    );
  }
}
