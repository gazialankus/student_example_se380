// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Student _$$_StudentFromJson(Map<String, dynamic> json) => _$_Student(
      name: json['name'] as String,
      age: json['age'] as int,
      grade: (json['grade'] as num).toDouble(),
    );

Map<String, dynamic> _$$_StudentToJson(_$_Student instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'grade': instance.grade,
    };
