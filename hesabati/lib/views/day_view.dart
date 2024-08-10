import 'package:flutter/material.dart';
import 'package:hesabati/widgets/add_day.dart';
import 'package:hesabati/widgets/day_view_body.dart';

class DayView extends StatelessWidget {
  const DayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return const AddDay();
              });
        },
        backgroundColor: const Color.fromARGB(255, 40, 66, 88),
        shape: const CircleBorder(),
        child: const Text(
          'اضافة ',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'الحسابات',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              right: 4,
              left: 4,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const Column(
            children: [
              DayViewBody(),
            ],
          ),
        ),
      ),
    );
  }
}

// class CustomAppBar extends StatelessWidget {
//   const CustomAppBar({
//     super.key,
//     required this.title,
//   });
//   final String title;
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text(
//         title,
//         style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
//       ),
//       centerTitle: true,
//     );
//   }
// }
