import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/features/quiz/domain/quiz.dart';
import 'package:quiz_app/src/providers/firebase_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_repostiory.g.dart';

@Riverpod(keepAlive: true)
QuizRepository quizRepository(Ref ref) {
  final firestore = ref.watch(firestoreProvider);
  return QuizRepository(firestore);
}

@Riverpod(keepAlive: true)
FutureOr<Quiz> fetchQuiz(Ref ref, String quizId) {
  final quizRepo = ref.watch(quizRepositoryProvider);
  return quizRepo.getQuiz(quizId);
}

class QuizRepository {
  final FirebaseFirestore _firestore;
  QuizRepository(
    this._firestore,
  );

  Future<Quiz> getQuiz(String quizId) async {
    DocumentSnapshot snapshot =
        await _firestore.collection('quizzes').doc(quizId).get();

    return Quiz.fromMap(snapshot.data() as Map<String, dynamic>);
  }
}
