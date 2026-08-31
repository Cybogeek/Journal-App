import 'package:flutter/material.dart';

import '../utils/app_constants.dart';

class AnimatedStatCard extends StatefulWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;

  const AnimatedStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  State<AnimatedStatCard> createState() => _AnimatedStatCardState();
}

class _AnimatedStatCardState extends State<AnimatedStatCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (_) => setState(() => _hovered = false),
      onTapDown: (_) => setState(() => _hovered = true),
      onTapCancel: () => setState(() => _hovered = false),
      child: AnimatedSlide(
        curve: Curves.easeInOut,
        offset: _hovered ? const Offset(0, 0.01) : Offset.zero,
        duration: AppConstants.cardAnimationDuration,
        child: AnimatedScale(
          curve: Curves.easeInOut,
          scale: _hovered ? 0.98 : 1.0,
          duration: AppConstants.cardAnimationDuration,
          child: AnimatedContainer(
            curve: Curves.easeInOut,
            duration: AppConstants.cardAnimationDuration,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: _hovered ? 0.2 : 0.1),
                  blurRadius: _hovered ? 24 : 14,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: widget.color.withValues(alpha: 0.12),
                  child: Icon(widget.icon, color: widget.color),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.value,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  widget.subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: widget.color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
