/// ***
/// This class consists of the DateWidget that is used in the ListView.builder
///
/// Author: Vivek Kaushik <me@vivekkasuhik.com>
/// github: https://github.com/iamvivekkaushik/
/// ***

import 'package:date_picker_timeline/gestures/tap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final DateSelectionCallback? onDateSelected;
  final String? locale;
  final Color unSelectedDateBorderColor;
  final Widget markDateWidget;

  DateWidget({
    required this.date,
    required this.markDateWidget,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    this.width,
    this.height,
    this.unSelectedDateBorderColor = Colors.black,
    this.onDateSelected,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 180,
        width: 90,
        child: Column(
          children: [
            Container(
              height: height ?? 80,
              width: width ?? 45,
              // padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: selectionColor),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(60)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(new DateFormat("E", locale).format(date).toUpperCase(), style: dayTextStyle),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selectionColor,
                      border: Border.all(color: unSelectedDateBorderColor),
                    ),
                    height: 40,
                    width: 40,
                    child: Center(child: Text(date.day.toString(), style: dateTextStyle)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            markDateWidget
          ],
        ),
      ),
      onTap: () {
        // Check if onDateSelected is not null
        if (onDateSelected != null) {
          // Call the onDateSelected Function
          onDateSelected!(this.date);
        }
      },
    );
  }
}
