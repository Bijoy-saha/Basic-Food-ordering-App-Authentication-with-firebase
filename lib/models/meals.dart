class Meal {
  final String id;
  final List<String> catagoriesId;
  final String imageUrl;
  final String title;
  final int duration;
  final List<String> ingredients;
  Meal({
    required this.id,
    required this.catagoriesId,
    required this.imageUrl,
    required this.title,
    required this.duration,
    required this.ingredients,
  });
}
