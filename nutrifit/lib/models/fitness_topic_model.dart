class FitnessTopic {
  final String id;
  final String title;
  final Category category;
  final String icon;
  final String imageUrl; // NEW: Main topic image
  final String thumbnailUrl; // NEW: Small preview image
  final int duration; // in minutes
  final List<String> tags;
  final DifficultyLevel difficulty;
  final int caloriesBurn; // NEW: Estimated calories burn
  final double rating; // NEW: User rating (0-5)
  final int totalSteps; // NEW: Total steps in workout

  FitnessTopic({
    required this.id,
    required this.title,
    required this.category,
    required this.icon,
    required this.imageUrl,
    required this.thumbnailUrl,
    required this.duration,
    required this.tags,
    required this.difficulty,
    this.caloriesBurn = 0,
    this.rating = 0.0,
    this.totalSteps = 0,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'category': category.name,
    'icon': icon,
    'imageUrl': imageUrl,
    'thumbnailUrl': thumbnailUrl,
    'duration': duration,
    'tags': tags,
    'difficulty': difficulty.name,
    'caloriesBurn': caloriesBurn,
    'rating': rating,
    'totalSteps': totalSteps,
  };

  factory FitnessTopic.fromJson(Map<String, dynamic> json) {
    return FitnessTopic(
      id: json['id'],
      title: json['title'],
      category: Category.values.firstWhere((e) => e.name == json['category']),
      icon: json['icon'],
      imageUrl: json['imageUrl'],
      thumbnailUrl: json['thumbnailUrl'],
      duration: json['duration'],
      tags: List<String>.from(json['tags']),
      difficulty: DifficultyLevel.values.firstWhere(
        (e) => e.name == json['difficulty'],
      ),
      caloriesBurn: json['caloriesBurn'] ?? 0,
      rating: json['rating'] ?? 0.0,
      totalSteps: json['totalSteps'] ?? 0,
    );
  }
}

enum DifficultyLevel { beginner, intermediate, advanced }

enum Category { cardio, strength, flexibility }
