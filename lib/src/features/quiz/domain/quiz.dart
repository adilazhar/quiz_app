import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:quiz_app/src/features/question/domain/question.dart';

@immutable
class Quiz extends Equatable {
  final String id;
  final String title;
  final String description;
  final String video;
  final String topic;
  final List<Question> questions;
  const Quiz({
    required this.id,
    required this.title,
    required this.description,
    required this.video,
    required this.topic,
    required this.questions,
  });

  Quiz copyWith({
    String? id,
    String? title,
    String? description,
    String? video,
    String? topic,
    List<Question>? questions,
  }) {
    return Quiz(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      video: video ?? this.video,
      topic: topic ?? this.topic,
      questions: questions ?? this.questions,
    );
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      video: map['video'] ?? '',
      topic: map['topic'] ?? '',
      questions: map['questions'] != null
          ? List<Question>.from(
              map['questions'].map((x) => Question.fromMap(x)))
          : [],
    );
  }

  factory Quiz.fromJson(String source) => Quiz.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Quiz(id: $id, title: $title, description: $description, video: $video, topic: $topic, questions: $questions)';
  }

  @override
  List<Object> get props {
    return [
      id,
      title,
      description,
      video,
      topic,
      questions,
    ];
  }
}
