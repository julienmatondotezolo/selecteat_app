class Meals {
  final String id;
  final String title;
  final String? timing;
  final String image;

  Meals({required this.id, required this.title, required this.timing, required this.image});

  factory Meals.fromJson(Map<String, dynamic> json) {
    return Meals(
      id: json['id'],
      title: json['title'],
      timing: json['timing'],
      image: json['image'],
    );
  }
}