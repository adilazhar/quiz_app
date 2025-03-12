import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/features/topic/domain/topic.dart';
import 'package:quiz_app/src/providers/firebase_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'topic_repository.g.dart';

@Riverpod(keepAlive: true)
TopicRepository topicRepository(Ref ref) {
  final firestore = ref.watch(firestoreProvider);
  return TopicRepository(firestore);
}

@Riverpod(keepAlive: true)
FutureOr<List<Topic>> fetchTopicList(Ref ref) {
  final topicRepo = ref.watch(topicRepositoryProvider);
  return topicRepo.fetchTopicList();
}

class TopicRepository {
  final FirebaseFirestore _firestore;
  TopicRepository(this._firestore);

  Future<List<Topic>> fetchTopicList() async {
    QuerySnapshot snapshot = await _firestore.collection('topics').get();

    List<Topic> topics = snapshot.docs.map((doc) {
      return Topic.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();

    return topics;
  }
}
