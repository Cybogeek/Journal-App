import 'package:flutter/material.dart';

class AnimatedcontrollerScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<AnimatedcontrollerScreen> createState() =>
      _AnimatedcontrollerScreenState();
}

class _AnimatedcontrollerScreenState extends State<AnimatedcontrollerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotation;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _rotation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _scale = Tween<double>(
      begin: 1,
      end: 1.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsetsGeometry.all(24),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              'Animated Controller Demo',
              style: TextStyle(fontSize: 24, color: Colors.blue),
            ),
            SizedBox(height: 16),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotation.value * 2 * 3.14159,
                  child: Transform.scale(
                    scale: _scale.value,
                    child: const Icon(
                      Icons.star,
                      size: 80,
                      color: Colors.amber,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: _startAnimation,
              child: Text(_controller.isCompleted ? 'Reset' : 'Animate!'),
            ),
          ],
        ),
      ),
    );
  }
}
