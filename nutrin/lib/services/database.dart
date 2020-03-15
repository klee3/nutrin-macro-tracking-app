import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobileapp/model/TrackedFood.dart';
import 'package:mobileapp/model/tracker.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // collection reference
  final CollectionReference trackerCollection =
      Firestore.instance.collection('Tracker');

  // TODO: should use enum
  Future updateUserData(String name, bool metric, String sex, double height,
      double weight) async {
    return await trackerCollection.document(uid).setData({
      'name': name,
      'metric': metric,
      'sex': sex,
      'height': height,
      'weight': weight
    });
  }

  Future updatePersonalNutrients(Map<String, double> nutrients) async {
    return await trackerCollection
        .document(uid)
        .setData({'personalNutrients': nutrients}, merge: true);
  }

  Future addEmptyMeals() async {
    return await trackerCollection.document(uid).setData({
      'meals': [
        {'mealName': 'breakfast', 'foods': []},
        {'mealName': 'lunch', 'foods': []},
        {'mealName': 'dinner', 'foods': []},
      ]
    }, merge: true);
  }

  // TODO: add foods up (sum total value)
  Future updateMeals(String meal, List<TrackedFood> foods) async {
    print(_mapFromListOfFoods(foods).toString());
    return await trackerCollection.document(uid).setData({
      'meals': [
        {'mealName': meal, 'foods': _mapFromListOfFoods(foods)}
      ]
    }, merge: true);
  }

  // get tracker stream
  Stream<Tracker> get tracker {
    return trackerCollection
        .document(uid)
        .snapshots()
        .map(_trackerFromSnapshot);
  }

  // get tracker list from snapshot
  Tracker _trackerFromSnapshot(DocumentSnapshot snapshot) {
    return Tracker(
        name: snapshot.data['name'] ?? '',
        sex: snapshot.data['sex'] ?? '',
        metric: snapshot.data['metric'] ?? true,
        height: snapshot.data['height'],
        weight: snapshot.data['weight']);
  }

  _mapFromListOfFoods(List<TrackedFood> foods) {
    return foods.map((food) => {
          'name': food.name,
          'protein': food.protein,
          'fat': food.fat,
          'carbohydrates': food.carbohydrates,
          'calcium': food.calcium,
          'calories': food.calories,
          'cholesterol': food.cholesterol,
          'iron': food.iron,
          'potassium': food.potassium,
          'sodium': food.sodium,
          'vitaminA': food.vitaminA,
          'vitaminC': food.vitaminC
        }).toList();
  }
}
