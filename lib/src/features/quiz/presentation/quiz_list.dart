import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/src/features/option/domain/option.dart';
import 'package:quiz_app/src/features/quiz/data/quiz_repostiory.dart';
import 'package:quiz_app/src/features/quiz/domain/quiz.dart';

import 'package:quiz_app/src/features/quiz/presentation/quiz_badge.dart';
import 'package:quiz_app/src/features/report/presentation/controller/report_controller.dart';
import 'package:quiz_app/src/features/topic/domain/topic.dart';
import 'package:quiz_app/src/features/topic/presentation/widgets/topic_progress.dart';

class QuizList extends StatelessWidget {
  final Topic topic;
  const QuizList({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: topic.quizzes.map(
        (quiz) {
          return Card(
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            elevation: 4,
            margin: const EdgeInsets.all(4),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => QuizScreen(quiz.id),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(
                    quiz.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  subtitle: Text(
                    quiz.description,
                    overflow: TextOverflow.fade,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  leading: QuizBadge(topic: topic, quizId: quiz.id),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen(
    this.quizId, {
    super.key,
  });

  final String quizId;

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  double progress = 0;
  Option? _selected;
  int correctAnswers = 0;

  final controller = PageController();

  void selected(Option? newValue) {
    setState(() {
      _selected = newValue;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void nextPage(Quiz quiz) async {
    progress = correctAnswers / quiz.questions.length;
    await controller.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  /// Bottom sheet shown when Question is answered
  _bottomSheet(BuildContext context, Option opt, Quiz quiz) {
    bool correct = opt.correct;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(correct ? 'Good Job!' : 'Wrong'),
              Text(
                opt.detail,
                style: const TextStyle(fontSize: 18, color: Colors.white54),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: correct ? Colors.green : Colors.red),
                child: Text(
                  correct ? 'Onward!' : 'Try Again',
                  style: const TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  if (correct) {
                    setState(() {
                      correctAnswers++;
                    });
                    nextPage(quiz);
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final quiz = ref.watch(fetchQuizProvider(widget.quizId));
    return quiz.when(
      data: (quiz) {
        return Scaffold(
          appBar: AppBar(
            title: AnimatedProgressbar(value: progress),
            leading: IconButton(
              icon: const Icon(Icons.close_rounded),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            controller: controller,
            itemBuilder: (BuildContext context, int idx) {
              if (idx == 0) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(quiz.title,
                          style: Theme.of(context).textTheme.headlineMedium),
                      const Divider(),
                      Expanded(child: Text(quiz.description)),
                      OverflowBar(
                        alignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton.icon(
                            onPressed: () {
                              nextPage(quiz);
                            },
                            label: const Text('Start Quiz!'),
                            icon: const Icon(Icons.poll),
                          )
                        ],
                      )
                    ],
                  ),
                );
              } else if (idx == quiz.questions.length + 1) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Congrats! You completed the ${quiz.title} quiz',
                        textAlign: TextAlign.center,
                      ),
                      const Divider(),
                      ElevatedButton.icon(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white),
                        icon: const Icon(Icons.check),
                        label: const Text(
                          ' Mark Complete!',
                        ),
                        onPressed: () {
                          ref
                              .read(reportControllerProvider.notifier)
                              .updateUserReport(quiz);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ));
                        },
                      )
                    ],
                  ),
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.center,
                        child: Text(quiz.questions[idx - 1].text),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: quiz.questions[idx - 1].options.map((opt) {
                          return Container(
                            height: 90,
                            margin: const EdgeInsets.only(bottom: 10),
                            color: Colors.black26,
                            child: InkWell(
                              onTap: () {
                                selected(opt);
                                _bottomSheet(context, opt, quiz);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  children: [
                                    Icon(
                                        _selected == opt
                                            ? Icons.circle
                                            : Icons.circle_outlined,
                                        size: 30),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 16),
                                        child: Text(
                                          opt.value,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                );
              }
            },
          ),
        );
      },
      error: (error, stackTrace) {
        return Scaffold(
          body: Center(
            child: Text(error.toString()),
          ),
        );
      },
      loading: () {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
