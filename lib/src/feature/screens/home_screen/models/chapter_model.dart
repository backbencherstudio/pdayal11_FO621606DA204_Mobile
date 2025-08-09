import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chapter {
  final String title;
  final String date;
  final String chapterId;
  final String topics;
  late final int topicsCount;
  late final int daysLeft;

  Chapter({
    required this.title,
    required this.date,
    required this.chapterId,
    required this.topics,
  })  : topicsCount = _getTopicCount(topics),
        daysLeft = _calculateDaysLeft(date);

  static int _getTopicCount(String topics) {
    return topics.isEmpty ? 0 : topics.split(',').length;
  }

  static int _calculateDaysLeft(String date) {
    final DateFormat format = DateFormat("MM/dd/yyyy");
    DateTime chapterDate;

    try {
      chapterDate = format.parseStrict(date);
    } catch (e) {
      debugPrint("Invalid date format: $date");
      return 0;
    }

    // time part remove kore difference nichi
    final today = DateUtils.dateOnly(DateTime.now());
    final target = DateUtils.dateOnly(chapterDate);

    return target.difference(today).inDays;
  }
}
