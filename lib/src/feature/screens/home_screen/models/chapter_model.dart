import 'package:flutter/cupertino.dart';
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
  }) : topicsCount = _getTopicCount(topics),
       daysLeft = _calculateDaysLeft(date);

  static int _getTopicCount(String topics) {
    return topics.isEmpty ? 0 : topics.split(',').length;
  }

  static int _calculateDaysLeft(String date) {
    final DateFormat format = DateFormat("MM/dd/yyyy");
    DateTime chapterDate;

    try {
      chapterDate = format.parse(date);
    } catch (e) {
      debugPrint("Invalid date format: $date");
      return 0;
    }
    DateTime today = DateTime.now();
    Duration difference = chapterDate.difference(today);
    return difference.inDays;
  }
}
