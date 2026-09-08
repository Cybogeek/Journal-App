import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  NotificationService._();

  static final NotificationService instance = NotificationService._();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;
  bool _canScheduleExactAlarms = false;

  Future<void> init() async {
    if (_initialized) return;

    await _configureLocalTimeZone();

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const iosSettings = DarwinInitializationSettings();

    const settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _plugin.initialize(settings: settings);

    _initialized = true;
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();

    try {
      //final localTimezone = await FlutterTimezone.getLocalTimezone();
      // The identifier is the IANA timezone name, for example:
      // America/New_York, Asia/Kolkata, Europe/London.
      final timezoneName = 'Asia/Kolkata'; //localTimezone.identifier;

      tz.setLocalLocation(
        tz.getLocation(timezoneName),
      ); // Set to Asia/Kolkata for testing purposes

      log('Device timezone: $timezoneName');
      log('tz.local: ${tz.local}');
      log('tz now: ${tz.TZDateTime.now(tz.local)}');
    } catch (e) {
      log('Failed to get local timezone. Falling back to UTC. Error: $e');
      // tz.setLocalLocation(tz.getLocation('UTC'));
    }
  }

  Future<void> requestPermissions() async {
    final androidPlugin = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    final notificationPermission = await androidPlugin
        ?.requestNotificationsPermission();

    log('Android notification permission: $notificationPermission');

    final exactAlarmPermission = await androidPlugin
        ?.requestExactAlarmsPermission();

    _canScheduleExactAlarms = exactAlarmPermission ?? false;

    log('Android exact alarm permission: $_canScheduleExactAlarms');

    final iosPlugin = _plugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >();

    await iosPlugin?.requestPermissions(alert: true, badge: true, sound: true);
  }

  Future<void> showInstantTestNotification() async {
    const androidDetails = AndroidNotificationDetails(
      'test_channel',
      'Test Notifications',
      channelDescription: 'Test notification channel',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: DarwinNotificationDetails(),
    );

    await _plugin.show(
      id: 999,
      title: 'Test Notification',
      body: 'If you can see this, Android notifications are working.',
      notificationDetails: details,
    );
  }

  Future<void> scheduleTodoReminder({
    required int notificationId,
    required String title,
    required String body,
    required DateTime scheduledAt,
  }) async {
    if (!_initialized) {
      await init();
    }

    final now = DateTime.now();

    log('------------------------------');
    log('Scheduling Todo Reminder');
    log('Notification ID: $notificationId');
    log('Now DateTime: $now');
    log('Selected DateTime: $scheduledAt');

    if (!scheduledAt.isAfter(now.add(const Duration(seconds: 20)))) {
      log(
        'Reminder skipped: selected time must be at least 20 seconds in the future.',
      );
      return;
    }

    final scheduledTzDateTime = tz.TZDateTime.from(scheduledAt, tz.local);

    log('Scheduled TZDateTime: $scheduledTzDateTime');
    log('Current TZDateTime: ${tz.TZDateTime.now(tz.local)}');
    log('Exact alarms allowed: $_canScheduleExactAlarms');

    const androidDetails = AndroidNotificationDetails(
      'todo_reminders_channel',
      'Todo Reminders',
      channelDescription: 'Notifications for scheduled todo reminders',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
      category: AndroidNotificationCategory.reminder,
      visibility: NotificationVisibility.public,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: DarwinNotificationDetails(),
    );

    await _plugin.cancel(id: notificationId);

    await _plugin.zonedSchedule(
      id: notificationId,
      title: title,
      body: body.isEmpty ? 'You have a todo reminder.' : body,
      scheduledDate: scheduledTzDateTime,
      notificationDetails: details,
      androidScheduleMode: _canScheduleExactAlarms
          ? AndroidScheduleMode.exactAllowWhileIdle
          : AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: null,
      payload: notificationId.toString(),
    );

    await debugPendingNotifications();
  }

  Future<void> cancelReminder(int notificationId) async {
    await _plugin.cancel(id: notificationId);
    log('Cancelled reminder id: $notificationId');
  }

  Future<void> cancelAll() async {
    await _plugin.cancelAll();
    log('Cancelled all reminders');
  }

  Future<void> debugPendingNotifications() async {
    final pending = await _plugin.pendingNotificationRequests();

    log('Pending notification count: ${pending.length}');

    for (final item in pending) {
      log(
        'Pending -> id: ${item.id}, title: ${item.title}, body: ${item.body}',
      );
    }

    log('------------------------------');
  }
}
