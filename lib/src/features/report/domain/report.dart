import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Report extends Equatable {
  final String uid;
  final int total;
  final Map topics;
  const Report({
    required this.uid,
    required this.total,
    required this.topics,
  });

  Report copyWith({
    String? uid,
    int? total,
    Map? topics,
  }) {
    return Report(
      uid: uid ?? this.uid,
      total: total ?? this.total,
      topics: topics ?? this.topics,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'total': total,
      'topics': topics,
    };
  }

  factory Report.empty() {
    return Report(uid: '', total: 0, topics: {});
  }

  factory Report.fromMap(Map<String, dynamic> map) {
    return Report(
      uid: map['uid'] ?? '',
      total: map['total']?.toInt() ?? 0,
      topics: Map.from(map['topics']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Report.fromJson(String source) => Report.fromMap(json.decode(source));

  @override
  String toString() => 'Report(uid: $uid, total: $total, topics: $topics)';

  @override
  List<Object> get props => [uid, total, topics];
}
