import 'package:flutter/material.dart';

class AnimatedopacityScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<AnimatedopacityScreen> createState() => _AnimatedopacityScreenState();
}

class _AnimatedopacityScreenState extends State<AnimatedopacityScreen> {
  bool _isVisible = true;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
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
              'Animated Opacity Demo',
              style: TextStyle(fontSize: 24, color: Colors.blue),
            ),
            SizedBox(height: 16),
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 600),
              curve: Curves.decelerate,
              child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: const Center(
                  child: Text(
                    'Fade',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: _toggleVisibility,
              child: Text(_isVisible ? 'Hide' : 'Show'),
            ),
          ],
        ),
      ),
    );
  }
}
