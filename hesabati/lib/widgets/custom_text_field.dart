// import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
//   const CustomTextField({
//     super.key,
//     required this.hint,
//     this.onSaved,
//     this.onChanged,
//     // required this.label,
//   });
//   final String hint;
//   // final String label;

//   final void Function(String?)? onSaved;
//   final void Function(String)? onChanged;
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       onChanged: onChanged,
//       onSaved: onSaved,
//       validator: (value) {
//         if (value?.isEmpty ?? true) {
//           return 'Field is required';
//         } else {
//           return null;
//         }
//       },
//       decoration: InputDecoration(
//           hintText: hint,
//           // labelText: label,
//           enabledBorder: const OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.black)),
//           focusedBorder: const OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.blue))),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.onSaved,
    this.onChanged,
    this.label,
    this.initialValue,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
  });

  final String hint;
  final String? label;
  final String? initialValue;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
