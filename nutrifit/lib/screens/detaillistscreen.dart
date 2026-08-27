import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrifit/models/fitness_topic_model.dart';
import 'package:nutrifit/models/nutrition_details_model.dart';
import 'package:nutrifit/providers/nutridetails_provider.dart';
import 'package:nutrifit/providers/nutrifit_provider.dart';

class Detaillistscreen extends StatefulWidget {
  const Detaillistscreen({super.key, required this.topicId});
  final String topicId;
  @override
  State<Detaillistscreen> createState() => _DetaillistscreenState();
}

class _DetaillistscreenState extends State<Detaillistscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        elevation: 4,
        title: Consumer(
          builder: (context, ref, _) {
            final topic = ref
                .watch(nutrifitProvider.notifier)
                .searchTopicByIndex(widget.topicId);
            return Text(
              topic?.title ?? 'Details',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            );
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer(
              builder: (context, ref, _) {
                final topic = ref
                    .watch(nutrifitProvider.notifier)
                    .searchTopicByIndex(widget.topicId);
                final details = ref
                    .watch(nutridetailsProvider.notifier)
                    .searchInstructionsByTopicId(widget.topicId);
                return ListView(
                  padding: const EdgeInsets.only(bottom: 20),
                  children: [
                    if (topic != null) _TopicSummary(topic: topic),
                    ...details.map((detail) => _StepCard(detail: detail)),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TopicSummary extends StatelessWidget {
  const _TopicSummary({required this.topic});
  final FitnessTopic topic;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      clipBehavior: Clip.antiAlias,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: 'topic-${topic.id}',
            child: Image.network(
              topic.imageUrl,
              height: 210,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Image.network(
                topic.thumbnailUrl,
                height: 210,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topic.title,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _InfoChip('${topic.category.name.toUpperCase()}', null),
                    _InfoChip('${topic.difficulty.name.toUpperCase()}', null),
                    _InfoChip(
                      '${topic.duration} min',
                      Icon(
                        Icons.schedule_rounded,
                        color: Colors.black54,
                        size: 16,
                      ),
                    ),
                    _InfoChip('${topic.caloriesBurn} kcal', null),
                    _InfoChip(
                      '${topic.rating}',
                      Icon(
                        Icons.star_rounded,
                        color: Color(0xffffb547),
                        size: 16,
                      ),
                    ),
                    _InfoChip('${topic.totalSteps} steps', null),
                  ],
                ),
                if (topic.tags.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Text(
                    topic.tags.map((tag) => '#$tag').join('  '),
                    style: TextStyle(color: Colors.teal),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip(this.label, this.icon);
  final String label;
  final Icon? icon;

  @override
  Widget build(BuildContext context) => Chip(
    label: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: .spaceBetween,
      children: [?icon, Text(label)],
    ),
    backgroundColor: Colors.teal.shade50,
  );
}

class _StepCard extends StatelessWidget {
  const _StepCard({required this.detail});
  final DetailedInstruction detail;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      color: Colors.tealAccent.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // if (detail.imageUrl.isNotEmpty)
          //   Image.network(
          //     detail.imageUrl,
          //     height: 160,
          //     width: double.infinity,
          //     fit: BoxFit.cover,
          //   ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.teal,
              child: Text(
                '${detail.stepNumber}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              detail.title,
              style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              detail.description,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Wrap(
              spacing: 8,
              children: [
                _InfoChip(
                  'Equipment: ${detail.equipment.name.toUpperCase()}',
                  null,
                ),
                if (detail.duration != null)
                  _InfoChip('${detail.duration}s', null),
                if (detail.isCompleted) const _InfoChip('Completed', null),
              ],
            ),
          ),
          if (detail.tips.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
              child: Text(
                'Tips: ${detail.tips.join(' • ')}',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          // if (detail.videoThumbnail != null)
          //   Image.network(
          //     detail.videoThumbnail!,
          //     height: 120,
          //     width: double.infinity,
          //     fit: BoxFit.cover,
          //   ),
        ],
      ),
    );
  }
}
