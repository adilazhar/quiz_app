import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/features/report/presentation/controller/report_controller.dart';
import 'package:quiz_app/src/features/topic/domain/topic.dart';

class QuizBadge extends ConsumerWidget {
  final String quizId;
  final Topic topic;

  const QuizBadge({super.key, required this.quizId, required this.topic});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completion = ref.watch(reportControllerProvider.selectAsync(
      (report) {
        final List completed = report.topics[topic.id] ?? [];
        if (completed.contains(quizId)) {
          return true;
        } else {
          return false;
        }
      },
    ));

    return FutureBuilder(
      future: completion,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Icon(Icons.circle_outlined, color: Colors.grey);
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            if (snapshot.data!) {
              return const Icon(Icons.check, color: Colors.green);
            } else {
              return const Icon(Icons.circle_outlined, color: Colors.grey);
            }
          }
        }
        return const Icon(Icons.circle_outlined, color: Colors.grey);
      },
    );
  }
}
