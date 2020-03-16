class Food {
  String name;
  DateTime bought;
  DateTime expires;
  int amount;
  String serving;
  bool expired;

  Food(
      {this.name,
      this.bought,
      this.expires,
      this.amount,
      this.serving,
      this.expired});

  int datesBetween() {
    return this.expires.difference(this.bought).inDays;
  }
}

List<Food> foods = [
  Food(
      name: "Broccoli",
      bought: new DateTime(2020, 3, 15),
      expires: new DateTime(2020, 03, 25),
      amount: 50,
      serving: "grams",
      expired: false),
  Food(name: "Milk",
      bought: new DateTime(2020, 3, 10),
      expires: new DateTime(2020, 03, 12),
      amount: 4,
      serving: "L",
      expired: true),
  Food(name: "Whole Wheat Bread",
      bought: new DateTime(2020, 3, 12),
      expires: new DateTime(2020, 03, 20),
      amount: 12,
      serving: "slices",
      expired: false),
];
