import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:quiz_app/src/features/quiz/domain/quiz.dart';

@immutable
class Topic extends Equatable {
  final String id;
  final String title;
  final String description;
  final String img;
  final List<Quiz> quizzes;
  const Topic({
    required this.id,
    required this.title,
    required this.description,
    required this.img,
    required this.quizzes,
  });

  Topic copyWith({
    String? id,
    String? title,
    String? description,
    String? img,
    List<Quiz>? quizzes,
  }) {
    return Topic(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      img: img ?? this.img,
      quizzes: quizzes ?? this.quizzes,
    );
  }

  factory Topic.fromMap(Map<String, dynamic> map) {
    return Topic(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      img: map['img'] ?? '',
      quizzes: map['quizzes'] != null
          ? List<Quiz>.from(map['quizzes']?.map((x) => Quiz.fromMap(x)))
          : [],
    );
  }

  factory Topic.fromJson(String source) => Topic.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Topic(id: $id, title: $title, description: $description, img: $img, quizzes: $quizzes)';
  }

  @override
  List<Object> get props {
    return [
      id,
      title,
      description,
      img,
      quizzes,
    ];
  }
}
