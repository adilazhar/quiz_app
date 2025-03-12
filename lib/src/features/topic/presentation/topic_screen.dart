import 'package:flutter/material.dart';
import 'package:quiz_app/src/features/quiz/presentation/quiz_list.dart';

import 'package:quiz_app/src/features/topic/domain/topic.dart';

class TopicScreen extends StatelessWidget {
  const TopicScreen({
    super.key,
    required this.topic,
  });

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic.title),
      ),
      body: ListView(
        children: [
          Hero(tag: topic.id, child: Image.asset('assets/covers/${topic.img}')),
          Text(
            topic.title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          QuizList(
            topic: topic,
          ),
        ],
      ),
    );
  }
}
