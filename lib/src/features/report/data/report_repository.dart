import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/features/quiz/domain/quiz.dart';
import 'package:quiz_app/src/features/report/domain/report.dart';
import 'package:quiz_app/src/providers/firebase_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_repository.g.dart';

@Riverpod(keepAlive: true)
ReportRepository reportRepository(Ref ref) {
  final firestore = ref.watch(firestoreProvider);
  return ReportRepository(firestore);
}

class ReportRepository {
  final FirebaseFirestore _firestore;

  ReportRepository(this._firestore);

  Stream<Report> watchUserReport(String userId) {
    final ref = _firestore.collection('reports').doc(userId);
    return ref.snapshots().map((doc) => Report.fromMap(doc.data()!));
  }

  Future<void> updateUserReport(Quiz quiz, String userId) async {
    final ref = _firestore.collection('reports').doc(userId);

    final report = {
      'total': FieldValue.increment(1),
      'topics': {
        quiz.topic: FieldValue.arrayUnion([quiz.id])
      }
    };

    return ref.set(report, SetOptions(merge: true));
  }
}
