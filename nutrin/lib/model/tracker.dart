import 'package:mobileapp/model/directory.dart';
import 'package:mobileapp/model/mealmodel.dart';

class Tracker {
  final String _name;
  final bool _metric;
  final String _sex;
  final double _weight;
  final double _height;
  final int _age;
  final double _activityLevel;
  final String _goal;
  Map<String, double> _personalNutrients;
  Map<String, MealModel> _meals;
  Directory _directory;

  Tracker(
      this._name,
      this._sex,
      this._metric,
      this._height,
      this._weight,
      this._age,
      this._activityLevel,
      this._goal,
      this._personalNutrients,
      this._meals,
      this._directory);

  Map<String, MealModel> get meals => _meals;

  Map<String, double> get personalNutrients => _personalNutrients;

  Directory get directory => _directory;
}
