import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/features/topic/data/topic_repository.dart';
import 'package:quiz_app/src/features/topic/presentation/widgets/topic_card.dart';
import 'package:quiz_app/src/features/topic/presentation/widgets/topic_drawer.dart';

class TopicGridView extends ConsumerWidget {
  const TopicGridView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topicsAsyncValue = ref.watch(fetchTopicListProvider);

    return topicsAsyncValue.when(
      data: (topics) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Topics '),
          ),
          drawer: TopicDrawer(topics: topics),
          body: GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
            ),
            itemCount: topics.length,
            itemBuilder: (context, index) {
              final topic = topics[index];
              return TopicCard(
                topic: topic,
              );
            },
          ),
        );
      },
      error: (error, stackTrace) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Topics '),
          ),
          body: Center(
            child: Text('Error'),
          ),
        );
      },
      loading: () {
        return Scaffold(
          appBar: AppBar(
            title: Text('Topics '),
          ),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
