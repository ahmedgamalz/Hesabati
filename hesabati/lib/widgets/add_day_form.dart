import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesabati/cubits/add_days_cubit/add_days_cubit.dart';
import 'package:hesabati/models/day_model.dart';
import 'package:hesabati/views/edit_day.dart';
import 'package:hesabati/widgets/custom_button.dart';
import 'package:hesabati/widgets/custom_text_field.dart';

class AddDayForm extends StatefulWidget {
  const AddDayForm({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<AddDayForm> createState() => _AddDayFormState();
}

class _AddDayFormState extends State<AddDayForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> formKey = GlobalKey();

  late String day;

  late dynamic date;

  int? dailyExpenses, totalRevenue, netRevenue, purchases;
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
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hint: 'اليوم',
            onSaved: (value) {
              day = value!;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            hint: 'التاريخ',
            onSaved: (value) {
              date = value;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            hint: 'اجمالي ايراد',
            onSaved: (value) {
              String convertedValue = convertArabicNumeralsToEnglish(value!);

              totalRevenue = int.tryParse(convertedValue) ?? 0;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
              hint: 'مصاريف يومية',
              onSaved: (value) {
                // Convert Arabic numerals to English numerals
                String convertedValue = convertArabicNumeralsToEnglish(value!);
                dailyExpenses = int.tryParse(convertedValue) ?? 0;
              }),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            hint: 'مشتريات',
            onSaved: (value) {
              String convertedValue = convertArabicNumeralsToEnglish(value!);

              purchases = int.tryParse(convertedValue) ?? 0;
            },
          ),
          const SizedBox(
            height: 64,
          ),
          BlocBuilder<AddDaysCubit, AddDaysState>(
            builder: (context, state) {
              return CustomButton(
                buttonText: 'اضافة',
                isLoading: state is AddDaysLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var noteModel = DayModel(
                        day: day,
                        date: date,
                        dailyExpenses: dailyExpenses!,
                        totalRevenue: totalRevenue!,
                        purchases: purchases!);
                    BlocProvider.of<AddDaysCubit>(context).addDays(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
