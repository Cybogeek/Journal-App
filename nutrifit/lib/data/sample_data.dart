import 'package:nutrifit/models/fitness_topic_model.dart';
import 'package:nutrifit/models/nutrition_details_model.dart';

class FitnessData {
  // Image URLs (using placeholder service - replace with actual image URLs)
  static const String _baseImageUrl =
      'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=870&auto=format&fit=crop';

  static final List<FitnessTopic> topics = [
    FitnessTopic(
      id: 't1',
      title: 'HIIT Cardio Blast',
      category: Category.cardio,
      icon: '🏃',
      imageUrl: '${_baseImageUrl}',
      thumbnailUrl:
          '${_baseImageUrl}1517837734378-7caf2939ad7b?w=400&h=300&fit=crop',
      duration: 25,
      tags: ['cardio', 'fat-burn', 'high-intensity'],
      difficulty: DifficultyLevel.intermediate,
      caloriesBurn: 350,
      rating: 4.8,
      totalSteps: 8,
    ),
    FitnessTopic(
      id: 't2',
      title: 'Core Strengthening',
      category: Category.strength,
      icon: '💪',
      imageUrl: '${_baseImageUrl}',
      thumbnailUrl:
          '${_baseImageUrl}1571019619289-2d8f0f666e21?w=400&h=300&fit=crop',
      duration: 20,
      tags: ['core', 'abs', 'stability'],
      difficulty: DifficultyLevel.beginner,
      caloriesBurn: 200,
      rating: 4.6,
      totalSteps: 6,
    ),
    FitnessTopic(
      id: 't3',
      title: 'Yoga Flow',
      category: Category.flexibility,
      icon: '🧘',
      imageUrl: '${_baseImageUrl}',
      thumbnailUrl:
          '${_baseImageUrl}1544367561-5d2f7d893f4c?w=400&h=300&fit=crop',
      duration: 30,
      tags: ['flexibility', 'mindfulness', 'stretching'],
      difficulty: DifficultyLevel.beginner,
      caloriesBurn: 180,
      rating: 4.9,
      totalSteps: 10,
    ),
    FitnessTopic(
      id: 't4',
      title: 'Leg Day Destroyer',
      category: Category.strength,
      icon: '🦵',
      imageUrl: '${_baseImageUrl}',
      thumbnailUrl:
          '${_baseImageUrl}1534434574269-9d8c7d9e9c1a?w=400&h=300&fit=crop',
      duration: 35,
      tags: ['legs', 'strength', 'muscle-building'],
      difficulty: DifficultyLevel.advanced,
      caloriesBurn: 450,
      rating: 4.7,
      totalSteps: 9,
    ),
    FitnessTopic(
      id: 't5',
      title: 'Full Body Workout',
      category: Category.strength,
      icon: '🏋️',
      imageUrl: '${_baseImageUrl}',
      thumbnailUrl:
          '${_baseImageUrl}1534434574269-9d8c7d9e9c1a?w=400&h=300&fit=crop',
      duration: 40,
      tags: ['full-body', 'strength', 'endurance'],
      difficulty: DifficultyLevel.intermediate,
      caloriesBurn: 500,
      rating: 4.5,
      totalSteps: 12,
    ),
    FitnessTopic(
      id: 't6',
      title: 'Morning Stretch Routine',
      category: Category.flexibility,
      icon: '🌅',
      imageUrl: '${_baseImageUrl}',
      thumbnailUrl:
          '${_baseImageUrl}1545388888-8f0f2f1a8c7e?w=400&h=300&fit=crop',
      duration: 10,
      tags: ['stretching', 'morning', 'mobility'],
      difficulty: DifficultyLevel.beginner,
      caloriesBurn: 80,
      rating: 4.9,
      totalSteps: 5,
    ),
    FitnessTopic(
      id: 't7',
      title: 'Tabata Training',
      category: Category.cardio,
      icon: '🔥',
      imageUrl: '${_baseImageUrl}',
      thumbnailUrl:
          '${_baseImageUrl}1517837734378-7caf2939ad7b?w=400&h=300&fit=crop',
      duration: 15,
      tags: ['cardio', 'intense', 'fat-burn'],
      difficulty: DifficultyLevel.advanced,
      caloriesBurn: 400,
      rating: 4.6,
      totalSteps: 8,
    ),
    FitnessTopic(
      id: 't8',
      title: 'Arm & Shoulder Workout',
      category: Category.strength,
      icon: '💪',
      imageUrl: '${_baseImageUrl}',
      thumbnailUrl:
          '${_baseImageUrl}1571019619289-2d8f0f666e21?w=400&h=300&fit=crop',
      duration: 25,
      tags: ['arms', 'shoulders', 'upper-body'],
      difficulty: DifficultyLevel.intermediate,
      caloriesBurn: 280,
      rating: 4.4,
      totalSteps: 7,
    ),
  ];

  static final List<DetailedInstruction> instructions = [
    // HIIT Cardio Blast Instructions
    DetailedInstruction(
      id: 'i1',
      topicId: 't1',
      stepNumber: 1,
      title: 'Warm-up',
      description: 'Start with 5 minutes of light jogging in place, arm circles, and dynamic stretches to prepare your body.',
      imageUrl:
          '${_baseImageUrl}1517837734378-7caf2939ad7b?w=600&h=400&fit=crop',
      tips: ['Keep your heart rate at 50-60% of max', 'Focus on mobility'],
      duration: 300,
      equipment: EquipmentType.none,
    ),
    DetailedInstruction(
      id: 'i2',
      topicId: 't1',
      stepNumber: 2,
      title: 'High Knees',
      description: 'Run in place while bringing your knees up to chest level. Maintain a quick pace for 30 seconds.',
      imageUrl:
          '${_baseImageUrl}1517837734378-7caf2939ad7b?w=600&h=400&fit=crop&crop=center',
      tips: ['Keep your core engaged', 'Land softly on the balls of your feet'],
      duration: 30,
      equipment: EquipmentType.none,
    ),
    DetailedInstruction(
      id: 'i3',
      topicId: 't1',
      stepNumber: 3,
      title: 'Burpees',
      description: 'Drop into a squat, kick your feet back, do a push-up, jump back to squat, and explode up with a jump.',
      imageUrl:
          '${_baseImageUrl}1517837734378-7caf2939ad7b?w=600&h=400&fit=crop&crop=center',
      tips: ['Keep your back straight', 'Land softly'],
      duration: 30,
      equipment: EquipmentType.none,
    ),
    DetailedInstruction(
      id: 'i4',
      topicId: 't1',
      stepNumber: 4,
      title: 'Mountain Climbers',
      description: 'Start in a plank position and alternately drive your knees toward your chest in a running motion.',
      imageUrl:
          '${_baseImageUrl}1517837734378-7caf2939ad7b?w=600&h=400&fit=crop&crop=center',
      tips: ['Keep your hips low', 'Maintain a steady rhythm'],
      duration: 30,
      equipment: EquipmentType.mat,
    ),
    DetailedInstruction(
      id: 'i5',
      topicId: 't1',
      stepNumber: 5,
      title: 'Rest & Repeat',
      description: 'Take 60 seconds of active recovery (light jogging), then repeat the circuit 3-4 times.',
      imageUrl:
          '${_baseImageUrl}1517837734378-7caf2939ad7b?w=600&h=400&fit=crop&crop=center',
      tips: ['Stay hydrated', 'Push your pace each round'],
      duration: 60,
      videoUrl: 'https://example.com/hiit-rest-video',
      videoThumbnail:
          '${_baseImageUrl}1517837734378-7caf2939ad7b?w=600&h=400&fit=crop&crop=center',
      equipment: EquipmentType.none,
    ),

    // Core Strengthening Instructions
    DetailedInstruction(
      id: 'i6',
      topicId: 't2',
      stepNumber: 1,
      title: 'Plank Hold',
      description: 'Start in a push-up position with your body in a straight line from head to heels. Hold this position.',
      imageUrl:
          '${_baseImageUrl}1571019619289-2d8f0f666e21?w=600&h=400&fit=crop&crop=center',
      tips: ['Squeeze your glutes', 'Draw your navel toward your spine'],
      duration: 30,
      equipment: EquipmentType.mat,
    ),
    DetailedInstruction(
      id: 'i7',
      topicId: 't2',
      stepNumber: 2,
      title: 'Bicycle Crunches',
      description: 'Lie on your back, bring knees to a tabletop position, and alternate touching elbow to opposite knee.',
      imageUrl:
          '${_baseImageUrl}1571019619289-2d8f0f666e21?w=600&h=400&fit=crop&crop=center',
      tips: ['Keep your neck relaxed', 'Control the movement'],
      duration: 45,
      equipment: EquipmentType.mat,
    ),
    DetailedInstruction(
      id: 'i8',
      topicId: 't2',
      stepNumber: 3,
      title: 'Russian Twists',
      description: 'Sit with knees bent, lean back slightly, and rotate your torso from side to side with hands together.',
      imageUrl:
          '${_baseImageUrl}1571019619289-2d8f0f666e21?w=600&h=400&fit=crop&crop=center',
      tips: ['Keep your back straight', 'Engage your obliques'],
      duration: 30,
      equipment: EquipmentType.mat,
    ),
    DetailedInstruction(
      id: 'i9',
      topicId: 't2',
      stepNumber: 4,
      title: 'Leg Raises',
      description: 'Lie flat on your back and raise your legs to 90 degrees, then lower them slowly without touching the floor.',
      imageUrl:
          '${_baseImageUrl}1571019619289-2d8f0f666e21?w=600&h=400&fit=crop&crop=center',
      tips: ['Press your lower back into the ground', 'Control the descent'],
      duration: 30,
      equipment: EquipmentType.mat,
    ),

    // Yoga Flow Instructions
    DetailedInstruction(
      id: 'i10',
      topicId: 't3',
      stepNumber: 1,
      title: 'Sun Salutation A',
      description: 'Flow through: Mountain Pose > Upward Salute > Forward Fold > Plank > Cobra > Downward Dog > Repeat.',
      imageUrl:
          '${_baseImageUrl}1544367561-5d2f7d893f4c?w=600&h=400&fit=crop&crop=center',
      tips: ['Breathe deeply', 'Connect breath with movement'],
      duration: 120,
      videoUrl: 'https://example.com/sun-salutation',
      videoThumbnail:
          '${_baseImageUrl}1544367561-5d2f7d893f4c?w=600&h=400&fit=crop&crop=center',
      equipment: EquipmentType.mat,
    ),
    DetailedInstruction(
      id: 'i11',
      topicId: 't3',
      stepNumber: 2,
      title: 'Warrior II Pose',
      description: 'From Downward Dog, step forward into a lunge, open arms, and hold the pose while breathing deeply.',
      imageUrl:
          '${_baseImageUrl}1544367561-5d2f7d893f4c?w=600&h=400&fit=crop&crop=center',
      tips: ['Keep front knee at 90°', 'Extend energy through fingertips'],
      duration: 30,
      equipment: EquipmentType.mat,
    ),
    DetailedInstruction(
      id: 'i12',
      topicId: 't3',
      stepNumber: 3,
      title: 'Tree Pose',
      description: 'Stand on one leg, place the other foot on your inner thigh, and join hands in prayer position.',
      imageUrl:
          '${_baseImageUrl}1544367561-5d2f7d893f4c?w=600&h=400&fit=crop&crop=center',
      tips: ['Find a focal point to balance', 'Engage standing leg muscles'],
      duration: 30,
      equipment: EquipmentType.mat,
    ),
    DetailedInstruction(
      id: 'i13',
      topicId: 't3',
      stepNumber: 4,
      title: 'Child\'s Pose',
      description: 'Kneel down, sit back on your heels, and stretch your arms forward on the ground.',
      imageUrl:
          '${_baseImageUrl}1544367561-5d2f7d893f4c?w=600&h=400&fit=crop&crop=center',
      tips: ['Allow your back to round gently', 'Rest here for a few breaths'],
      duration: 60,
      equipment: EquipmentType.mat,
    ),

    // Leg Day Destroyer Instructions
    DetailedInstruction(
      id: 'i14',
      topicId: 't4',
      stepNumber: 1,
      title: 'Squat Warm-up',
      description: 'Perform bodyweight squats with proper form: back straight, chest up, sit back like in a chair.',
      imageUrl:
          '${_baseImageUrl}1534434574269-9d8c7d9e9c1a?w=600&h=400&fit=crop&crop=center',
      tips: ['Keep weight in heels', 'Go below parallel if possible'],
      duration: 180,
      equipment: EquipmentType.none,
    ),
    DetailedInstruction(
      id: 'i15',
      topicId: 't4',
      stepNumber: 2,
      title: 'Barbell Squats',
      description: 'Place barbell on upper back, squat down with control, and push through heels to stand up.',
      imageUrl:
          '${_baseImageUrl}1534434574269-9d8c7d9e9c1a?w=600&h=400&fit=crop&crop=center',
      tips: ['Brace your core', 'Keep the bar in a straight line'],
      duration: 300,
      videoUrl: 'https://example.com/barbell-squats',
      videoThumbnail:
          '${_baseImageUrl}1534434574269-9d8c7d9e9c1a?w=600&h=400&fit=crop&crop=center',
      equipment: EquipmentType.barbell,
    ),
    DetailedInstruction(
      id: 'i16',
      topicId: 't4',
      stepNumber: 3,
      title: 'Lunges',
      description: 'Step forward into a lunge, lowering your back knee toward the ground. Alternate legs.',
      imageUrl:
          '${_baseImageUrl}1534434574269-9d8c7d9e9c1a?w=600&h=400&fit=crop&crop=center',
      tips: ['Keep your torso upright', 'Don\'t let front knee pass toes'],
      duration: 240,
      equipment: EquipmentType.dumbbells,
    ),
    DetailedInstruction(
      id: 'i17',
      topicId: 't4',
      stepNumber: 4,
      title: 'Romanian Deadlifts',
      description: 'Hold weights in front, hinge at the hips with a slight bend in knees, and lower weights down your shins.',
      imageUrl:
          '${_baseImageUrl}1534434574269-9d8c7d9e9c1a?w=600&h=400&fit=crop&crop=center',
      tips: ['Keep your back straight', 'Feel the hamstring stretch'],
      duration: 240,
      equipment: EquipmentType.dumbbells,
    ),

    // Full Body Workout Instructions
    DetailedInstruction(
      id: 'i18',
      topicId: 't5',
      stepNumber: 1,
      title: 'Push-ups',
      description: 'Start in plank position, lower your chest to the floor, and push back up while keeping your body straight.',
      imageUrl:
          '${_baseImageUrl}1534434574269-9d8c7d9e9c1a?w=600&h=400&fit=crop&crop=center',
      tips: ['Elbows at 45°', 'Modify with knees if needed'],
      duration: 60,
      equipment: EquipmentType.mat,
    ),
    DetailedInstruction(
      id: 'i19',
      topicId: 't5',
      stepNumber: 2,
      title: 'Squat Press',
      description: 'Hold dumbbells, perform a squat, and press weights overhead as you stand up.',
      imageUrl:
          '${_baseImageUrl}1534434574269-9d8c7d9e9c1a?w=600&h=400&fit=crop&crop=center',
      tips: ['Coordinate the movement', 'Keep weights controlled'],
      duration: 60,
      equipment: EquipmentType.dumbbells,
    ),
    DetailedInstruction(
      id: 'i20',
      topicId: 't5',
      stepNumber: 3,
      title: 'Bent-over Rows',
      description: 'Hinge at hips, keep back straight, and pull weights toward your chest with elbows driving back.',
      imageUrl:
          '${_baseImageUrl}1534434574269-9d8c7d9e9c1a?w=600&h=400&fit=crop&crop=center',
      tips: ['Squeeze shoulder blades together', 'Don\'t use momentum'],
      duration: 60,
      equipment: EquipmentType.dumbbells,
    ),
    DetailedInstruction(
      id: 'i21',
      topicId: 't5',
      stepNumber: 4,
      title: 'Plank with Shoulder Taps',
      description: 'In plank position, alternate tapping your opposite shoulder, maintaining hip stability.',
      imageUrl:
          '${_baseImageUrl}1534434574269-9d8c7d9e9c1a?w=600&h=400&fit=crop&crop=center',
      tips: ['Keep hips level', 'Don\'t rush'],
      duration: 45,
      equipment: EquipmentType.mat,
    ),

    // Morning Stretch Routine Instructions
    DetailedInstruction(
      id: 'i22',
      topicId: 't6',
      stepNumber: 1,
      title: 'Cat-Cow Stretch',
      description: 'On all fours, alternate between arching your back up (cat) and letting your belly drop (cow).',
      imageUrl:
          '${_baseImageUrl}1545388888-8f0f2f1a8c7e?w=600&h=400&fit=crop&crop=center',
      tips: ['Move with your breath', 'Take 5 deep breaths'],
      duration: 60,
      equipment: EquipmentType.mat,
    ),
    DetailedInstruction(
      id: 'i23',
      topicId: 't6',
      stepNumber: 2,
      title: 'Neck & Shoulder Rolls',
      description: 'Gently roll your neck in circles and roll your shoulders forward and backward.',
      imageUrl:
          '${_baseImageUrl}1545388888-8f0f2f1a8c7e?w=600&h=400&fit=crop&crop=center',
      tips: ['Keep movements slow', 'Don\'t force any stretch'],
      duration: 60,
      equipment: EquipmentType.none,
    ),
    DetailedInstruction(
      id: 'i24',
      topicId: 't6',
      stepNumber: 3,
      title: 'Forward Fold',
      description: 'Stand with feet hip-width apart, fold forward, and let your head hang heavy.',
      imageUrl:
          '${_baseImageUrl}1545388888-8f0f2f1a8c7e?w=600&h=400&fit=crop&crop=center',
      tips: ['Bend knees slightly', 'Let gravity do the work'],
      duration: 60,
      equipment: EquipmentType.none,
    ),
    DetailedInstruction(
      id: 'i25',
      topicId: 't6',
      stepNumber: 4,
      title: 'Standing Quad Stretch',
      description: 'Stand on one leg, grab your ankle, and pull your heel toward your glute.',
      imageUrl:
          '${_baseImageUrl}1545388888-8f0f2f1a8c7e?w=600&h=400&fit=crop&crop=center',
      tips: ['Keep your standing knee soft', 'Hold for 30 seconds each side'],
      duration: 60,
      equipment: EquipmentType.none,
    ),

    // Tabata Training Instructions
    DetailedInstruction(
      id: 'i26',
      topicId: 't7',
      stepNumber: 1,
      title: 'Tabata Squat Jumps',
      description: 'Perform squat jumps for 20 seconds all-out, then rest for 10 seconds.',
      imageUrl:
          '${_baseImageUrl}1517837734378-7caf2939ad7b?w=600&h=400&fit=crop&crop=center',
      tips: ['Give 100% effort', 'Land softly'],
      duration: 20,
      equipment: EquipmentType.none,
    ),
    DetailedInstruction(
      id: 'i27',
      topicId: 't7',
      stepNumber: 2,
      title: 'Tabata Push-ups',
      description: 'Do as many push-ups as possible for 20 seconds, then rest for 10 seconds.',
      imageUrl:
          '${_baseImageUrl}1517837734378-7caf2939ad7b?w=600&h=400&fit=crop&crop=center',
      tips: ['Full range of motion', 'Explosive movement'],
      duration: 20,
      equipment: EquipmentType.none,
    ),
    DetailedInstruction(
      id: 'i28',
      topicId: 't7',
      stepNumber: 3,
      title: 'Tabata Mountain Climbers',
      description: 'Maximum pace mountain climbers for 20 seconds, followed by 10 seconds rest.',
      imageUrl:
          '${_baseImageUrl}1517837734378-7caf2939ad7b?w=600&h=400&fit=crop&crop=center',
      tips: ['Drive knees hard', 'Keep your core tight'],
      duration: 20,
      equipment: EquipmentType.mat,
    ),
    DetailedInstruction(
      id: 'i29',
      topicId: 't7',
      stepNumber: 4,
      title: 'Cool Down',
      description: 'Slow jog for 2 minutes followed by static stretches for all major muscle groups.',
      imageUrl:
          '${_baseImageUrl}1517837734378-7caf2939ad7b?w=600&h=400&fit=crop&crop=center',
      tips: ['Lower heart rate gradually', 'Hold each stretch 30 seconds'],
      duration: 120,
      equipment: EquipmentType.mat,
    ),

    // Arm & Shoulder Workout Instructions
    DetailedInstruction(
      id: 'i30',
      topicId: 't8',
      stepNumber: 1,
      title: 'Dumbbell Shoulder Press',
      description: 'Press dumbbells overhead from shoulder height, keeping core engaged and back straight.',
      imageUrl:
          '${_baseImageUrl}1571019619289-2d8f0f666e21?w=600&h=400&fit=crop&crop=center',
      tips: ['Don\'t lock elbows', 'Control the descent'],
      duration: 120,
      equipment: EquipmentType.dumbbells,
    ),
    DetailedInstruction(
      id: 'i31',
      topicId: 't8',
      stepNumber: 2,
      title: 'Bicep Curls',
      description: 'Hold dumbbells with palms facing up, curl weights toward shoulders, and squeeze at the top.',
      imageUrl:
          '${_baseImageUrl}1571019619289-2d8f0f666e21?w=600&h=400&fit=crop&crop=center',
      tips: ['Keep elbows pinned to sides', 'Slow and controlled'],
      duration: 90,
      equipment: EquipmentType.dumbbells,
    ),
    DetailedInstruction(
      id: 'i32',
      topicId: 't8',
      stepNumber: 3,
      title: 'Tricep Pushdowns',
      description: 'Use a cable machine or resistance band to push down, extending your arms fully.',
      imageUrl:
          '${_baseImageUrl}1571019619289-2d8f0f666e21?w=600&h=400&fit=crop&crop=center',
      tips: ['Squeeze triceps at bottom', 'Don\'t let elbows drift'],
      duration: 90,
      equipment: EquipmentType.resistanceBand,
    ),
    DetailedInstruction(
      id: 'i33',
      topicId: 't8',
      stepNumber: 4,
      title: 'Lateral Raises',
      description: 'Raise dumbbells out to the sides to shoulder height with a slight bend in elbows.',
      imageUrl:
          '${_baseImageUrl}1571019619289-2d8f0f666e21?w=600&h=400&fit=crop&crop=center',
      tips: ['Control the weight', 'Use a slight forward lean'],
      duration: 90,
      equipment: EquipmentType.dumbbells,
    ),
  ];

  // Helper methods remain the same...
  // static List<DetailedInstruction> getInstructionsForTopic(String topicId) {
  //   return instructions
  //       .where((instruction) => instruction.topicId == topicId)
  //       .toList();
  // }

  // static List<FitnessTopic> getTopicsByCategory(String category) {
  //   return topics.where((topic) => topic.category == category).toList();
  // }

  // static List<FitnessTopic> getTopicsByDifficulty(DifficultyLevel difficulty) {
  //   return topics.where((topic) => topic.difficulty == difficulty).toList();
  // }

  // static FitnessTopic? getTopicById(String id) {
  //   try {
  //     return topics.firstWhere((topic) => topic.id == id);
  //   } catch (e) {
  //     return null;
  //   }
  // }

  // static DetailedInstruction? getInstructionById(String id) {
  //   try {
  //     return instructions.firstWhere((instruction) => instruction.id == id);
  //   } catch (e) {
  //     return null;
  //   }
  // }
}
