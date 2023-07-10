import 'package:flutter/material.dart';

import '../constant/colors.dart';

class DateDailyWidget extends StatelessWidget {
  final String dayName;
  final int dateInt;
  final int dayValue;
  final int group;
  const DateDailyWidget(
      {super.key,
      required this.dayName,
      required this.dayValue,
      required this.group,
      required this.dateInt});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(dayName, style: const TextStyle(fontSize: 10)),
        const SizedBox(height: 10),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: dayValue == group ? primary : white,
            shape: BoxShape.circle,
            border: Border.all(color: dayValue == group ? primary : black),
          ),
          child: Center(
            child: Text(
              dateInt.toString(),
              style: TextStyle(
                  fontSize: 10, color: dayValue == group ? white : black),
            ),
          ),
        )
      ],
    );
  }
}
