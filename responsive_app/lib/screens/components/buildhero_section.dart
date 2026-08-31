import 'package:flutter/material.dart';
import 'package:responsive_app/utils/app_constants.dart';

class BuildheroSection extends StatefulWidget {
  const BuildheroSection({super.key, required this.mediaSize});
  final Size mediaSize;
  @override
  State<BuildheroSection> createState() => _BuildheroSectionState();
}

class _BuildheroSectionState extends State<BuildheroSection> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= AppConstants.mobileBreakpoint;

        final textSection = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Adaptive UI for every screen',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'This demo adjusts layouts for mobile, tablet, and large screens using MediaQuery and LayoutBuilder.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF4F46E5),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 14,
                ),
              ),
              child: const Text('Explore'),
            ),
          ],
        );

        final visualSection = TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.95, end: 1.0),
          duration: const Duration(milliseconds: 900),
          curve: Curves.easeOutBack,
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: Container(
                height: widget.mediaSize.width < 700 ? 180 : 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.16),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white24),
                ),
                child: const Center(
                  child: Icon(
                    Icons.devices_rounded,
                    size: 72,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        );

        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF4F46E5), Color(0xFF06B6D4)],
            ),
            borderRadius: BorderRadius.circular(28),
          ),
          child: isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: textSection),
                    const SizedBox(width: 24),
                    Expanded(flex: 1, child: visualSection),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    textSection,
                    const SizedBox(height: 24),
                    visualSection,
                  ],
                ),
        );
      },
    );
  }
}
