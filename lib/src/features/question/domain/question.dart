import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:quiz_app/src/features/option/domain/option.dart';

@immutable
class Question extends Equatable {
  final String text;
  final List<Option> options;
  const Question({
    required this.text,
    required this.options,
  });

  Question copyWith({
    String? text,
    List<Option>? options,
  }) {
    return Question(
      text: text ?? this.text,
      options: options ?? this.options,
    );
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      text: map['text'] ?? '',
      options: map['options'] != null
          ? List<Option>.from(map['options']?.map((x) => Option.fromMap(x)))
          : [],
    );
  }

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source));

  @override
  String toString() => 'Question(text: $text, options: $options)';

  @override
  List<Object> get props => [text, options];
}
