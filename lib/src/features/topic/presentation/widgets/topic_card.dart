import 'package:flutter/material.dart';

import 'package:quiz_app/src/features/topic/domain/topic.dart';
import 'package:quiz_app/src/features/topic/presentation/topic_screen.dart';
import 'package:quiz_app/src/features/topic/presentation/widgets/topic_progress.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({
    super.key,
    required this.topic,
  });

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => TopicScreen(
          topic: topic,
        ),
      )),
      child: Card(
        elevation: 4.0,
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Hero(
                tag: topic.id,
                child: Image.asset(
                  'assets/covers/${topic.img}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                topic.title,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            TopicProgress(topic: topic)
          ],
        ),
      ),
    );
  }
}
