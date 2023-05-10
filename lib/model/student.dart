import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';
part 'student.g.dart';

@freezed
class Student with _$Student {
  const factory Student({
    required String id,
    required String name,
    required int age,
    required double grade,
  }) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  factory Student.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? _,
      ) =>
      Student.fromJson({
        'id': snapshot.id,
        ...snapshot.data()!,
      });

  static Map<String, Object?> toFirestore(
      Student value,
      SetOptions? options,
      ) =>
      value.toJson().remove('id');
}
