import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constant/colors.dart';
import 'date_item_widget.dart';

class DateHeaderWidget extends StatefulWidget {
  const DateHeaderWidget({super.key});

  @override
  State<DateHeaderWidget> createState() => _DateHeaderWidgetState();
}

class _DateHeaderWidgetState extends State<DateHeaderWidget> {
  int groupInt = 1;

  @override
  Widget build(BuildContext context) {
    // const Map<int, String> weekdayName = {
    //   1: "Monday",
    //   2: "Tuesday",
    //   3: "Wednesday",
    //   4: "Thursday",
    //   5: "Friday",
    //   6: "Saturday",
    //   7: "Sunday"
    // };
    //  dd MMMM

    final dateTime = DateTime.now();
    return Container(
      decoration: BoxDecoration(color: white, boxShadow: [
        BoxShadow(
          color: grey.withOpacity(.01),
          spreadRadius: 10,
          blurRadius: 3,
        )
      ]),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 60, bottom: 25, right: 20, left: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Your Daily",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: black,
                  ),
                ),
                Icon(Icons.search)
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                8,
                (index) {
                  if (index == 7) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          groupInt = index + 1;
                        });
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        margin: const EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: groupInt == 8 ? primary : white,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: groupInt == 8 ? primary : black),
                        ),
                        child: Center(
                          child: Text(
                            "More",
                            style: TextStyle(
                                fontSize: 10,
                                color: groupInt == 8 ? white : black),
                          ),
                        ),
                      ),
                    );
                  }
                  final released = DateFormat('EEEE,dd', 'id_ID').format(
                    dateTime.add(Duration(days: index)),
                  );

                  final currentDateIndex = released.split(',');
                  final dayName = currentDateIndex.first;
                  final dateInt = int.tryParse(currentDateIndex.last) ?? 0;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        groupInt = index + 1;
                      });
                    },
                    child: DateDailyWidget(
                      group: groupInt,
                      dateInt: dateInt,
                      dayValue: index + 1,
                      dayName: dayName.substring(0, 3),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
