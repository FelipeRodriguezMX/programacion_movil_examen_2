import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

TimeOfDay actualTime() => TimeOfDay.now();
String formateTime(TimeOfDay time) => time.toString().substring(10, 15);

DateTime actualDate() => DateTime.now();
String formatDate(DateTime date) => DateFormat('d-MM-yyyy').format(date);
