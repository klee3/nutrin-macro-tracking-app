class Recipe {
  String imageURL;
  String name;
  String category;
  String description;

  Recipe({this.imageURL, this.name, this.category, this.description});
}

List<Recipe> recipes = [
  Recipe(
      imageURL: 'assets/banana.jpeg',
      name: "Banana Bread",
      category: "Dessert",
      description:
          "With its super-moist texture, buttery banana and brown sugar flavors, and incredibly soft crumb, ..."),
  Recipe(
      imageURL: 'assets/bibimbap.jpeg',
      name: "Bibimbap",
      category: "Main",
      description:
          "Use this recipe to make bibimbap, a delicious, gorgeous and easily tweaked dish for different ... read more"),
  Recipe(
      imageURL: 'assets/keto.jpeg',
      name: "Keto Steak",
      category: "Main",
      description:
          "This quick-and-easy skillet entree is definitely restaurant-quality and sure to become a staple at ...")
];
