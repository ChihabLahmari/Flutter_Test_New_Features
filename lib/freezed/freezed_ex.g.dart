// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freezed_ex.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonImpl _$$PersonImplFromJson(Map<String, dynamic> json) => _$PersonImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      age: (json['age'] as num?)?.toInt() ?? 21,
      jobs: (json['jobs'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$PersonImplToJson(_$PersonImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'age': instance.age,
      'jobs': instance.jobs,
    };
