class TrackedFood {
  // TODO: could make nutrient class
  final String name;
  // final double _calories;
  final String carbohydrates;
  final String protein;
  final String fat;
  // final double _calcium;
  // final double _fiber;
  // final double _cholesterol;
  // final double _iron;
  // final double _potassium;
  // final double _sodium;
  // final double _vitaminA;
  // final double _vitaminC;
  final String unit;
  final String serving;

  TrackedFood(
      this.name,
      // this._calories,
      this.carbohydrates,
      this.protein,
      this.fat,
      // this._calcium,
      // this._fiber,
      // this._cholesterol,
      // this._iron,
      // this._potassium,
      // this._sodium,
      // this._vitaminA,
      // this._vitaminC,
      this.serving,
      this.unit);

  factory TrackedFood.fromJson(Map<String, dynamic> json) {
    return TrackedFood(
      json['n'],
      json['n'],
      json['n'],
      json['n'],
      json['n'],
      json['n'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      "serving": serving,
      "unit": unit,
      // 'calories': _calories,
      'carbohydrates': carbohydrates,
      'protein': protein,
      'fat': fat,
      // 'calcium': _calcium,
      // 'fiber': _fiber,
      // 'cholesterol': _cholesterol,
      // 'iron': _iron,
      // 'potassium': _potassium,
      // 'sodium': _sodium,
      // 'vitaminA': _vitaminA,
      // 'vitaminC': _vitaminC,
    };
  }
}
