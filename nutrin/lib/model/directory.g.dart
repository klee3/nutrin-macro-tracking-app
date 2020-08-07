// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Directory _$DirectoryFromJson(Map<String, dynamic> json) {
  return Directory(
    (json['foods'] as List)
        ?.map((e) =>
            e == null ? null : TrackedFood.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DirectoryToJson(Directory instance) => <String, dynamic>{
      'foods': instance.foods,
    };
