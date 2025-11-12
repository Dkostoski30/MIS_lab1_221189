import 'package:flutter/material.dart';
import '../models/exam.dart';

import '../widgets/exam_widget.dart';

class ExamsListScreen extends StatelessWidget {
  const ExamsListScreen({super.key});

  List<Exam> getExams() {
    return [
      Exam(examName: 'Вештачка интелигенција', dateTime: DateTime(2026, 6, 10, 9, 0), rooms: ['223']),
      Exam(examName: 'Мобилни апликации', dateTime: DateTime(2026, 6, 12, 10, 0), rooms: ['Lab3', '117']),
      Exam(examName: 'Интернет технологии', dateTime: DateTime(2026, 5, 25, 12, 0), rooms: ['Lab2']),
      Exam(examName: 'Машинско учење', dateTime: DateTime(2026, 6, 15, 9, 0), rooms: ['Lab13']),
      Exam(examName: 'Бази на податоци', dateTime: DateTime(2026, 5, 20, 11, 0), rooms: ['Lab12']),
      Exam(examName: 'Оперативни системи', dateTime: DateTime(2024, 6, 18, 13, 0), rooms: ['117']),
      Exam(examName: 'Софтверско инженерство', dateTime: DateTime(2024, 5, 27, 9, 0), rooms: ['Online']),
      Exam(examName: 'Компјутерски мрежи', dateTime: DateTime(2026, 6, 23, 11, 0), rooms: ['Lab 2']),
      Exam(examName: 'Алгоритми и структури на податоци', dateTime: DateTime(2025, 5, 15, 10, 0), rooms: ['Online']),
    ]..sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  @override
  Widget build(BuildContext context) {
    final exams = getExams();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 221189'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) => ExamCard(exam: exams[index]),
            ),
          ),
          Container(
            color: Colors.blueAccent,
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            child: Center(
              child: Text(
                'Вкупно испити: ${exams.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
