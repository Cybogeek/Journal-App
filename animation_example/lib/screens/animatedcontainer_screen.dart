import 'package:flutter/material.dart';

class AnimatedcontainerScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<AnimatedcontainerScreen> createState() =>
      _AnimatedcontainerScreenState();
}

class _AnimatedcontainerScreenState extends State<AnimatedcontainerScreen> {
  bool _isLarge = false;
  Color _color = Colors.blue;
  double _borderRadius = 10;

  void _animate() {
    setState(() {
      _isLarge = !_isLarge;
      _color = _isLarge ? Colors.deepPurple : Colors.blue;
      _borderRadius = _isLarge ? 100 : 16;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              'Animated Container Demo',
              style: TextStyle(fontSize: 24, color: _color),
            ),
            SizedBox(height: 16),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              width: _isLarge ? 200 : 100,
              height: _isLarge ? 200 : 100,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(_borderRadius),
                boxShadow: [
                  BoxShadow(
                    color: _color.withAlpha(80),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: _animate,
              child: Text(_isLarge ? 'Shrink' : 'Expand'),
            ),
          ],
        ),
      ),
    );
  }
}
