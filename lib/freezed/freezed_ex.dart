import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_ex.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'freezed_ex.g.dart';

//       ⬇ to avoid this : "person.list.add('student'); // throws because we are mutating a collection"
@Freezed(makeCollectionsUnmodifiable: false)
class Person with _$Person {
  const factory Person({
    required String firstName,
    required String lastName,
    @Default(21) int age,
    required List<String> jobs,
  }) = _Person;

  factory Person.fromJson(Map<String, Object?> json) => _$PersonFromJson(json);
}
