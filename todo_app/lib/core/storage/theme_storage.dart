import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeStorage {
  static const _themeModePrefix = 'theme_mode';
  static const _seedColorPrefix = 'seed_color';
  static const _guestKey = 'guest';

  String _themeModeKey(String? userId) =>
      '${_themeModePrefix}_${userId ?? _guestKey}';
  String _seedColorKey(String? userId) =>
      '${_seedColorPrefix}_${userId ?? _guestKey}';

  Future<void> saveThemeMode({
    required String? userId,
    required ThemeMode mode,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeModeKey(userId), mode.name);
  }

  Future<ThemeMode> loadThemeMode(String? userId) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_themeModeKey(userId));

    return ThemeMode.values.firstWhere(
      (e) => e.name == value,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> saveSeedColor({
    required String? userId,
    required Color color,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_seedColorKey(userId), color.toARGB32());
  }

  Future<Color> loadSeedColor(String? userId) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getInt(_seedColorKey(userId));
    return value != null ? Color(value) : const Color(0xFF6750A4);
  }
}
