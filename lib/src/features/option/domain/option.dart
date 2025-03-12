import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Option extends Equatable {
  final String value;
  final String detail;
  final bool correct;
  const Option({
    required this.value,
    required this.detail,
    required this.correct,
  });

  Option copyWith({
    String? value,
    String? detail,
    bool? correct,
  }) {
    return Option(
      value: value ?? this.value,
      detail: detail ?? this.detail,
      correct: correct ?? this.correct,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'detail': detail,
      'correct': correct,
    };
  }

  factory Option.fromMap(Map<String, dynamic> map) {
    return Option(
      value: map['value'] ?? '',
      detail: map['detail'] ?? '',
      correct: map['correct'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Option.fromJson(String source) => Option.fromMap(json.decode(source));

  @override
  String toString() =>
      'Option(value: $value, detail: $detail, correct: $correct)';

  @override
  List<Object> get props => [value, detail, correct];
}
