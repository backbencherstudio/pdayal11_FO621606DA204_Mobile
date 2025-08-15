import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chapter {
  final String title;
  final String date;
  final String chapterId;
  final String topics;
  late final int topicsCount;
  late final int daysLeft;
  late final double? progress;
  final int? pendingTaskCount;
  final int? completedTaskCount;

  Chapter({
    required this.title,
    required this.date,
    required this.chapterId,
    required this.topics,
    required this.progress,
    this.pendingTaskCount,
    this.completedTaskCount
  })  : topicsCount = _getTopicCount(topics),
        daysLeft = _calculateDaysLeft(date);

  static int _getTopicCount(String topics) {
    return topics.isEmpty ? 0 : topics.split(',').length;
  }

  void updateProgress() {
    if (topicsCount == 0) {
      progress = 0.0;
      return;
    }

    final completedTasks = completedTaskCount ?? 0;
    progress = completedTasks / topicsCount;
  }

  static int _calculateDaysLeft(String date) {
    final today = DateUtils.dateOnly(DateTime.now());
    if (date == "Today") return 0;
    if (date == "Tomorrow") return 1;
    if (date == "Yesterday") return 0; // Or -1

    final DateFormat format = DateFormat("MM/dd/yyyy");
    DateTime chapterDate;

    try {
      chapterDate = format.parseStrict(date);
    } catch (e) {
      debugPrint("Invalid date format: $date");
      return 0;
    }
    final target = DateUtils.dateOnly(chapterDate);

    int difference = target.difference(today).inDays;

    // If the date is tomorrow (difference == 1), then return 1, etc.
    return difference >= 0 ? difference : 0;
  }

}
