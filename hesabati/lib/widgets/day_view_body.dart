// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hesabati/cubits/days/days_cubit.dart';
// import 'package:hesabati/widgets/day_list_view.dart';

// class DayViewBody extends StatefulWidget {
//   const DayViewBody({
//     super.key,
//   });

//   @override
//   State<DayViewBody> createState() => _DayViewBodyState();
// }

// class _DayViewBodyState extends State<DayViewBody> {
//   @override
//   void initState() {
//     BlocProvider.of<DaysCubit>(context).fetchAllDays();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//       child: Column(
//         children: [
//           const SizedBox(
//             height: 10,
//           ),
//           Container(
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 66, 65, 65),
//               borderRadius: BorderRadius.circular(16),
//             ),
//             height: 64,
//             child: const Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     '10000',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 35,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     '  : رصيد الخزنة ',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 35,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           SizedBox(
//               height: MediaQuery.sizeOf(context).height - 250,
//               child: const Expanded(child: DayLIstView()))
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesabati/cubits/days/days_cubit.dart';
import 'package:hesabati/models/day_model.dart';
import 'package:hesabati/widgets/day_list_view.dart';

class DayViewBody extends StatefulWidget {
  const DayViewBody({super.key});

  @override
  State<DayViewBody> createState() => _DayViewBodyState();
}

class _DayViewBodyState extends State<DayViewBody> {
  int calculateSafeBalance(List<DayModel>? days) {
    if (days == null || days.isEmpty) return 0;
    return days.fold(0, (sum, day) => sum + day.netRevenue);
  }

  @override
  void initState() {
    BlocProvider.of<DaysCubit>(context).fetchAllDays();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DaysCubit, DaysState>(
      builder: (context, state) {
        if (state is DaysSuccess) {
          final days = context.read<DaysCubit>().days;
          final safeBalance = calculateSafeBalance(days);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 66, 65, 65),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  height: 64,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          safeBalance.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          '  : رصيد الخزنة ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                    height: MediaQuery.sizeOf(context).height - 250,
                    child: const DayLIstView())
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
