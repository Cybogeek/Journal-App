class DetailedInstruction {
  final String id;
  final String topicId;
  final int stepNumber;
  final String title;
  final String description;
  final String imageUrl; // NEW: Step image
  final String? videoThumbnail; // NEW: Video thumbnail if available
  final List<String> tips;
  final int? duration; // in seconds, optional
  final String? videoUrl;
  final EquipmentType equipment; // NEW: Required equipment
  final bool isCompleted; // NEW: Track progress

  DetailedInstruction({
    required this.id,
    required this.topicId,
    required this.stepNumber,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.videoThumbnail,
    required this.tips,
    this.duration,
    this.videoUrl,
    this.equipment = EquipmentType.none,
    this.isCompleted = false,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'topicId': topicId,
    'stepNumber': stepNumber,
    'title': title,
    'description': description,
    'imageUrl': imageUrl,
    'videoThumbnail': videoThumbnail,
    'tips': tips,
    'duration': duration,
    'videoUrl': videoUrl,
    'equipment': equipment.name,
    'isCompleted': isCompleted,
  };

  factory DetailedInstruction.fromJson(Map<String, dynamic> json) =>
      DetailedInstruction(
        id: json['id'],
        topicId: json['topicId'],
        stepNumber: json['stepNumber'],
        title: json['title'],
        description: json['description'],
        imageUrl: json['imageUrl'],
        videoThumbnail: json['videoThumbnail'],
        tips: List<String>.from(json['tips']),
        duration: json['duration'],
        videoUrl: json['videoUrl'],
        equipment: EquipmentType.values.firstWhere(
          (e) => e.name == json['equipment'],
          orElse: () => EquipmentType.none,
        ),
        isCompleted: json['isCompleted'] ?? false,
      );
}

enum EquipmentType {
  none,
  mat,
  dumbbells,
  barbell,
  resistanceBand,
  kettlebell,
  bench,
  cableMachine,
}
