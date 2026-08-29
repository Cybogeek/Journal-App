import 'package:easy_counter/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Reset to 0',
            onPressed: () => ref.read(counterProvider.notifier).reset(),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              const Text(
                'Current Count',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(
                '$count',
                style: TextStyle(
                  fontSize: 120,
                  fontWeight: FontWeight.w300,
                  color: count >= 0 ? Colors.indigo : Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsetsGeometry.only(bottom: 32),
        child: Row(
          mainAxisAlignment: .center,
          children: [
            FloatingActionButton(
              heroTag: 'decrement',
              onPressed: () => ref.read(counterProvider.notifier).decrement(),
              backgroundColor: Colors.red.shade50,
              foregroundColor: Colors.redAccent,
              child: const Icon(Icons.remove, size: 28),
            ),
            const SizedBox(width: 24),
            FloatingActionButton.extended(
              heroTag: 'increment',
              onPressed: () => ref.read(counterProvider.notifier).increment(),
              icon: const Icon(Icons.add, size: 28),
              label: const Text('Increment'),
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
