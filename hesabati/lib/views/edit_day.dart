// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hesabati/cubits/add_days_cubit/add_days_cubit.dart';
// import 'package:hesabati/cubits/days/days_cubit.dart';
// import 'package:hesabati/models/day_model.dart';
// import 'package:hesabati/widgets/custom_button.dart';
// import 'package:hesabati/widgets/custom_text_field.dart';

// class EditDay extends StatefulWidget {
//   const EditDay({super.key, required this.day});
//   final DayModel day;

//   @override
//   State<EditDay> createState() => _EditDayState();
// }

// class _EditDayState extends State<EditDay> {
//   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

//   final GlobalKey<FormState> formKey = GlobalKey();

//   late String day;

//   late dynamic date;

//   int? dailyExpenses, totalRevenue, netRevenue, purchases;
//   String convertArabicNumeralsToEnglish(String input) {
//     const arabicToEnglish = {
//       '٠': '0',
//       '١': '1',
//       '٢': '2',
//       '٣': '3',
//       '٤': '4',
//       '٥': '5',
//       '٦': '6',
//       '٧': '7',
//       '٨': '8',
//       '٩': '9'
//     };

//     return input.split('').map((char) => arabicToEnglish[char] ?? char).join();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//       child: Column(
//         children: [
//           SizedBox(
//             height: 64,
//           ),
//           Form(
//             key: formKey,
//             autovalidateMode: autovalidateMode,
//             child: Column(
//               children: [
//                 Text(
//                   'تعديل حسابات يوم',
//                   style: const TextStyle(
//                       fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 CustomTextField(
//                   hint: 'اليوم',
//                   onSaved: (value) {
//                     day = value!;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 CustomTextField(
//                   hint: 'التاريخ',
//                   onSaved: (value) {
//                     date = value;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 CustomTextField(
//                     hint: 'مصاريف يومية',
//                     onSaved: (value) {
//                       // Convert Arabic numerals to English numerals
//                       String convertedValue =
//                           convertArabicNumeralsToEnglish(value!);
//                       dailyExpenses = int.tryParse(convertedValue) ?? 0;
//                     }),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 CustomTextField(
//                   hint: 'اجمالي ايراد',
//                   onSaved: (value) {
//                     String convertedValue =
//                         convertArabicNumeralsToEnglish(value!);

//                     totalRevenue = int.tryParse(convertedValue) ?? 0;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 CustomTextField(
//                   hint: 'صافي ايراد',
//                   onSaved: (value) {
//                     String convertedValue =
//                         convertArabicNumeralsToEnglish(value!);

//                     netRevenue = int.tryParse(convertedValue) ?? 0;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 CustomTextField(
//                   hint: 'مشتريات',
//                   onSaved: (value) {
//                     String convertedValue =
//                         convertArabicNumeralsToEnglish(value!);

//                     purchases = int.tryParse(convertedValue) ?? 0;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 64,
//                 ),
//                 BlocBuilder<AddDaysCubit, AddDaysState>(
//                   builder: (context, state) {
//                     return CustomButton(
//                       buttonText: 'تعديل',
//                       isLoading: state is AddDaysLoading ? true : false,
//                       onTap: () {
//                         widget.day.day = day ?? widget.day.day;
//                         widget.day.date = date ?? widget.day.date;
//                         widget.day.dailyExpenses =
//                             dailyExpenses ?? widget.day.dailyExpenses;
//                         widget.day.totalRevenue =
//                             totalRevenue ?? widget.day.totalRevenue;

//                         widget.day.purchases =
//                             purchases ?? widget.day.purchases;

//                         widget.day.save();
//                         BlocProvider.of<DaysCubit>(context).fetchAllDays();
//                         Navigator.pop(context);
//                       },
//                     );
//                   },
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     ));
//   }
// }

// EditDay Widget
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesabati/cubits/add_days_cubit/add_days_cubit.dart';
import 'package:hesabati/cubits/days/days_cubit.dart';
import 'package:hesabati/models/day_model.dart';
import 'package:hesabati/widgets/custom_button.dart';
import 'package:hesabati/widgets/custom_text_field.dart';

class EditDay extends StatefulWidget {
  const EditDay({super.key, required this.day});
  final DayModel day;

  @override
  State<EditDay> createState() => _EditDayState();
}

class _EditDayState extends State<EditDay> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey();

  late String day;
  late dynamic date;
  int? dailyExpenses, totalRevenue, netRevenue, purchases;

  @override
  void initState() {
    super.initState();
    day = widget.day.day;
    date = widget.day.date;
    dailyExpenses = widget.day.dailyExpenses;
    totalRevenue = widget.day.totalRevenue;
    netRevenue = widget.day.netRevenue;
    purchases = widget.day.purchases;
  }

  String convertArabicNumeralsToEnglish(String input) {
    const arabicToEnglish = {
      '٠': '0',
      '١': '1',
      '٢': '2',
      '٣': '3',
      '٤': '4',
      '٥': '5',
      '٦': '6',
      '٧': '7',
      '٨': '8',
      '٩': '9'
    };

    return input.split('').map((char) => arabicToEnglish[char] ?? char).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 64),
              Form(
                key: formKey,
                autovalidateMode: autovalidateMode,
                child: Column(
                  children: [
                    const Text(
                      'تعديل حسابات يوم',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 32),
                    CustomTextField(
                      hint: 'اليوم',
                      initialValue: day,
                      onSaved: (value) {
                        day = value ?? widget.day.day;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hint: 'التاريخ',
                      initialValue: date,
                      onSaved: (value) {
                        date = value ?? widget.day.date;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hint: 'اجمالي ايراد',
                      initialValue: totalRevenue?.toString(),
                      onSaved: (value) {
                        String convertedValue =
                            convertArabicNumeralsToEnglish(value ?? '');
                        totalRevenue = int.tryParse(convertedValue) ??
                            widget.day.totalRevenue;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hint: 'مصاريف يومية',
                      initialValue: dailyExpenses?.toString(),
                      onSaved: (value) {
                        String convertedValue =
                            convertArabicNumeralsToEnglish(value ?? '');
                        dailyExpenses = int.tryParse(convertedValue) ??
                            widget.day.dailyExpenses;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hint: 'مشتريات',
                      initialValue: purchases?.toString(),
                      onSaved: (value) {
                        String convertedValue =
                            convertArabicNumeralsToEnglish(value ?? '');
                        purchases = int.tryParse(convertedValue) ??
                            widget.day.purchases;
                      },
                    ),
                    const SizedBox(height: 64),
                    BlocBuilder<AddDaysCubit, AddDaysState>(
                      builder: (context, state) {
                        return CustomButton(
                          buttonText: 'تعديل',
                          isLoading: state is AddDaysLoading,
                          onTap: () {
                            formKey.currentState?.save();
                            widget.day
                              ..day = day
                              ..date = date
                              ..dailyExpenses = dailyExpenses!
                              ..totalRevenue = totalRevenue!
                              ..purchases = purchases!
                              ..save();
                            BlocProvider.of<DaysCubit>(context).fetchAllDays();
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
