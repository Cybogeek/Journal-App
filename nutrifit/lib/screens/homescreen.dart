import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrifit/models/fitness_topic_model.dart';
import 'package:nutrifit/providers/nutrifit_provider.dart';
import 'package:nutrifit/screens/detaillistscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;
  @override
  State<HomeScreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<HomeScreen> {
  List<FitnessTopic>? topics;
  final List<DifficultyLevel> _difficultyLevel = DifficultyLevel.values;
  final List<Category> _categories = Category.values;
  String _filter = 'All';
  Enum? _selectedValue;
  @override
  void initState() {
    super.initState();
  }

  void _onFilterValueSelected(WidgetRef ref, Enum value) {
    setState(() => _selectedValue = value);
    if (_filter == 'All') {
      topics = ref.read(nutrifitProvider);
    } else if (_filter == 'Category') {
      topics = ref
          .read(nutrifitProvider.notifier)
          .searchTopicsByCategory(value as Category);
    } else if (_filter == 'Difficulty') {
      topics = ref
          .read(nutrifitProvider.notifier)
          .searchTopicsByDifficulty(value as DifficultyLevel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          DropdownButton<String>(
            value: _filter,
            underline: const SizedBox.shrink(),
            icon: Icon(Icons.arrow_downward_sharp),
            dropdownColor: Colors.teal,
            alignment: AlignmentGeometry.center,
            style: TextStyle(color: Colors.white, fontSize: 16),
            items: const [
              DropdownMenuItem(value: 'All', child: Text('All')),
              DropdownMenuItem(value: 'Category', child: Text('Category')),
              DropdownMenuItem(value: 'Difficulty', child: Text('Difficulty')),
            ],
            onChanged: (value) {
              if (value == null) return;
              setState(() {
                _filter = value;
                _selectedValue = null;
                if (value == 'All') {
                  topics = null;
                }
              });
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final allTopics = ref.watch(nutrifitProvider);
          final visibleTopics = topics ?? allTopics;
          return Column(
            children: [
              if (_filter != 'All')
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                  child: Row(
                    children: [
                      Text('$_filter: '),
                      Expanded(
                        child: Wrap(
                          spacing: 6,
                          children:
                              (_filter == 'Category'
                                      ? _categories
                                      : _difficultyLevel)
                                  .map(
                                    (value) => ChoiceChip(
                                      label: Text(value.name),
                                      selected: _selectedValue == value,
                                      onSelected: (_) =>
                                          _onFilterValueSelected(ref, value),
                                    ),
                                  )
                                  .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              if (visibleTopics.isNotEmpty)
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final columns = constraints.maxWidth >= 1200
                          ? 4
                          : constraints.maxWidth >= 760
                          ? 3
                          : 2;
                      return GridView.builder(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                        itemCount: visibleTopics.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: constraints.maxWidth < 600
                              ? .78
                              : .9,
                        ),
                        itemBuilder: (context, index) {
                          final topic = visibleTopics[index];
                          return Card(
                            margin: EdgeInsets.zero,
                            elevation: 0,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: InkWell(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Detaillistscreen(topicId: topic.id),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        Hero(
                                          tag: 'topic-${topic.id}',
                                          child: Image.network(
                                            topic.imageUrl,
                                            fit: BoxFit.cover,
                                            errorBuilder: (_, __, ___) =>
                                                Container(
                                                  color: const Color(
                                                    0xffdcefe9,
                                                  ),
                                                ),
                                          ),
                                        ),
                                        DecoratedBox(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.transparent,
                                                Colors.black.withAlpha(150),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 12,
                                          right: 12,
                                          bottom: 12,
                                          child: Text(
                                            topic.title,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment: .spaceBetween,
                                            children: [
                                              Text(
                                                topic.category.name
                                                    .toUpperCase(),
                                                style: const TextStyle(
                                                  color: Color(0xff159a82),
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w800,
                                                  letterSpacing: .7,
                                                ),
                                              ),

                                              Text(
                                                topic.icon,
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.schedule_rounded,
                                                size: 16,
                                                color: Colors.black54,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                '${topic.duration} min',
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                ),
                                              ),
                                              const Spacer(),
                                              const Icon(
                                                Icons.star_rounded,
                                                size: 17,
                                                color: Color(0xffffb547),
                                              ),
                                              const SizedBox(width: 3),
                                              Text(
                                                topic.rating.toStringAsFixed(1),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
