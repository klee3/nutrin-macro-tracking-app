import 'package:mobileapp/model/tracked_food.dart';
import 'package:json_annotation/json_annotation.dart';

part 'directory.g.dart';

@JsonSerializable()
class Directory {
  List<TrackedFood> foods;

  Directory(this.foods);

  factory Directory.fromJson(Map<dynamic, dynamic> json) =>
      _$DirectoryFromJson(json);

  Map<dynamic, dynamic> toJson() => _$DirectoryToJson(this);
}
