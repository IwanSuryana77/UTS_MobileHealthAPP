import 'package:flutter/material.dart';

Future<TimeOfDay?> openTimePicker(BuildContext context) async {
  return await showTimePicker(
    context: context,
    initialTime: const TimeOfDay(hour: 9, minute: 0),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF4D90FE),
          ),
        ),
        child: child!,
      );
    },
  );
}
