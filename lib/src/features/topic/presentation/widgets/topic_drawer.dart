import 'package:flutter/material.dart';
import 'package:quiz_app/src/features/quiz/presentation/quiz_list.dart';
import 'package:quiz_app/src/features/topic/domain/topic.dart';

class TopicDrawer extends StatelessWidget {
  final List<Topic> topics;
  const TopicDrawer({super.key, required this.topics});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      clipBehavior: Clip.hardEdge,
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: topics.length,
          itemBuilder: (BuildContext context, int idx) {
            Topic topic = topics[idx];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    topic.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                QuizList(topic: topic)
              ],
            );
          },
          separatorBuilder: (BuildContext context, int idx) =>
              const Divider(thickness: 2)),
    );
  }
}
