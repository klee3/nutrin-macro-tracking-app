import 'package:mobileapp/model/tracked_food.dart';
import 'package:mobileapp/model/tracker.dart';

class Directory {
  List<TrackedFood> _foods;

  Directory(this._foods);

  List<TrackedFood> get foods => _foods;
}
