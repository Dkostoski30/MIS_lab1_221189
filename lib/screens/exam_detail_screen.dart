import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  String getRemainingTime() {
    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);

    if (diff.isNegative) {
      return "Испитот е веќе одржан";
    }

    final days = diff.inDays;
    final hours = diff.inHours % 24;

    return "$days дена, $hours часа преостануваат";
  }

  @override
  Widget build(BuildContext context) {
    // ✅ FIXED: Use DateFormat instead of DateTime
    final dateFormat = DateFormat("dd.MM.yyyy HH:mm");
    final isPast = exam.dateTime.isBefore(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.examName),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exam.examName,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // Date and Time
                Row(
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.blueAccent),
                    const SizedBox(width: 8),
                    Text(
                      dateFormat.format(exam.dateTime), // ✅ FIXED: correct format()
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Rooms
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_on, color: Colors.blueAccent),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        exam.rooms.join(', '),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Remaining time
                Row(
                  children: [
                    const Icon(Icons.timer, color: Colors.blueAccent),
                    const SizedBox(width: 8),
                    Text(
                      getRemainingTime(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: isPast ? Colors.grey : Colors.black,
                      ),
                    ),
                  ],
                ),
                const Spacer(),

                // Status
                Align(
                  alignment: Alignment.centerRight,
                  child: Chip(
                    label: Text(
                      isPast ? "Испитот е завршен" : "",
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor:
                    isPast ? Colors.green.shade600 : Colors.blueAccent,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
