class Meals {
  final String title;
  final String description;
  final String image;
  final String cookingtime;
  final String preparationtime;
  final String difficulty;
  final String budget;
  final String persons;
  final String ingredients;
  final String steps;

  Meals({required this.title, required this.description, required this.image, required this.cookingtime, required this.preparationtime, required this.difficulty, required this.budget, required this.persons, required this.ingredients, required this.steps});

  factory Meals.fromJson(Map<String, dynamic> json) {
    return Meals(
      title: json['title'],
      description: json['description'],
      image: json['image'],
      cookingtime: json['cookingtime'],
      preparationtime: json['preparationtime'],
      difficulty: json['difficulty'],
      budget: json['budget'],
      persons: json['persons'],
      ingredients: json['ingredients'],
      steps: json['steps'],
    );
  }
}