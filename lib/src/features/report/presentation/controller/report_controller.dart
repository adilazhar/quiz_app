import 'package:quiz_app/src/features/quiz/domain/quiz.dart';
import 'package:quiz_app/src/features/report/data/report_repository.dart';
import 'package:quiz_app/src/features/report/domain/report.dart';
import 'package:quiz_app/src/providers/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_controller.g.dart';

@Riverpod(keepAlive: true)
class ReportController extends _$ReportController {
  @override
  Stream<Report> build() {
    final userId = ref.read(firebaseAuthProvider).currentUser!.uid;

    final reportRepo = ref.read(reportRepositoryProvider);
    return reportRepo.watchUserReport(userId);
  }

  void updateUserReport(Quiz quiz) {
    final reportRepo = ref.read(reportRepositoryProvider);
    final userId = ref.read(firebaseAuthProvider).currentUser!.uid;

    reportRepo.updateUserReport(quiz, userId);
  }
}
