import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterNotifier extends Notifier<int> {
  static const _key = 'counter_value';
  @override
  int build() {
    _initstatefromPrefs();
    return 0;
  }

  Future<void> _initstatefromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getInt(_key) ?? 0;
    state = saved;
  }

  Future<void> _savetoPrefs(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, value);
  }

  void increment() {
    final int counterValue = state + 1;
    state = counterValue;
    _savetoPrefs(counterValue);
  }

  void decrement() {
    final int counterValue = state - 1;
    state = counterValue;
    _savetoPrefs(counterValue);
  }

  void reset() {
    state = 0;
    _savetoPrefs(0);
  }
}

final counterProvider = NotifierProvider<CounterNotifier, int>(
  CounterNotifier.new,
);
